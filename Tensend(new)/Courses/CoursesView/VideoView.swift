//
//  VideoView.swift
//  Tensend(new)
//
//  Created by Sultan on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import AVFoundation
import AVKit
import SDWebImage

class VideoView: UIView {
    
    var playButton = UIButton()
    var parrent = UIViewController()
    let img = ""
    var videoURL : URL?
    var obj : Course?
    var material : MaterialResponse?
    let imgView = UIImageView()
    init(parrentVC: UIViewController, obj: Course? = nil, material: MaterialResponse? = nil) {
        super.init(frame: .zero)
        self.parrent = parrentVC
        
        if obj != nil {
            self.obj = obj
            self.size()
        } else if material != nil {
            self.material = material
            self.size()
            if let videoUrl = material?.material?.videoPath, let url = URL(string: imageUrl + videoUrl.encodeUrl){
                playButton.isHidden = false
                NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
                self.videoURL = url
            }
        }
        
        if let videoUrl = obj?.trailer, let url = URL(string: imageUrl + videoUrl){
            playButton.isHidden = false
            self.videoURL = url
        }
//        self.relod()
    }
    func relod(){
        if let img = obj?.imagePath ?? self.material?.material?.imgPath {
            imgView.sd_setImage(with: URL(string: apiImgUrl + img.encodeUrl), completed: nil)
        }
        if let video = obj?.trailer ?? material?.material?.videoPath ,let url = URL(string: imageUrl + video.encodeUrl){
            self.videoURL = url
        }
    }
    @objc func playPressed(_ sender: UIButton){
        playVideo(url: self.videoURL!)
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
    }
    func size(){
        self.addSubview(imgView)
        if let img = obj?.imagePath {
            imgView.sd_setImage(with: URL(string: apiImgUrl + img), completed: nil)
            imgView.easy.layout(Edges())
        }
        if let img = self.material?.material?.imgPath {
            self.addSubview(imgView)
            imgView.sd_setImage(with: URL(string: apiImgUrl + img), completed: nil)
            imgView.easy.layout(Edges())
        }
        easy.layout(Height(242))
        addSubview(playButton)
        playButton.easy.layout(Height(46),Width(46),CenterX(),CenterY())
        playButton.cornerRadius(radius: 23, width: 0)
        playButton.isHidden = true
        playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        playButton.backgroundColor = .white
        playButton.addTarget(self, action: #selector(playPressed(_:)), for: .touchUpInside)
    }
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        
        self.parrent.present(vc, animated: true) { vc.player?.play() }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
