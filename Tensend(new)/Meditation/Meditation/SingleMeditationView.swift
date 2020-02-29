//
//  SingleMeditationView.swift
//  Tensend(new)
//
//  Created by root user on 2/27/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import SDWebImage
import AVKit

class SingleMeditationView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var isPlaying = false
    var presenter : SingleMeditationPresenterProtocol?
    var player: AVPlayer!
    var selectedAuthorIndex = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var meditationNameLabel: UILabel!
    @IBOutlet weak var dictorNameLabel: UILabel!
    @IBOutlet weak var dictorImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var playImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "AuthorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AuthorsCollectionViewCell")
        self.tabBarController?.tabBar.isHidden = true
    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorsCollectionViewCell", for: indexPath) as! AuthorsCollectionViewCell
        let audio = self.presenter?.meditation?.meditation?.audios?[indexPath.row]
        cell.authorImageView.sd_setImage(with: URL(string: imageUrl + (audio?.imgPath?.encodeUrl ?? "")), completed: nil)
        if self.selectedAuthorIndex == indexPath.row{
            cell.authorImageView.cornerRadius(radius: 12, width: 1, color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        }else{
            cell.authorImageView.cornerRadius(radius: 12, width: 1, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        }
        
        cell.authorLabel.text = audio?.author?.name ?? ""
        cell.backgroundColor = .clear
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedAuthorIndex = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.meditation?.meditation?.audios?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
}

extension SingleMeditationView : SingleMeditationProtocol{
    func setUpViews() {
        self.backgroundImageView.sd_setImage(with: URL(string: imageUrl + (self.presenter?.meditation?.meditation?.imgPath?.encodeUrl ?? "")), completed: nil)
        self.backgroundImageView.contentMode = .scaleAspectFill
        self.dictorImageView.cornerRadius(radius: 18, width: 1)
        self.meditationNameLabel.text = self.presenter?.meditation?.meditation?.title ?? ""
        let audio = self.presenter?.meditation?.meditation?.audios?[0]
        self.dictorImageView.sd_setImage(with: URL(string: imageUrl + (audio?.author?.imagePath ?? "")), completed: nil)
        self.dictorNameLabel.text = audio?.author?.name ?? ""
        self.collectionView.reloadData()
        self.collectionView.backgroundColor = .clear
        self.playView.cornerRadius(radius: 28, width: 1)
        self.playImageView.image = #imageLiteral(resourceName: "play")
        
        let url = URL.init(string: imageUrl + audio!.audioPath!)
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)


        self.playView.addTapGestureRecognizer {
            self.play()
        }
        
    }
    
  
    func play(){
      
        
        if isPlaying{
            player.pause()
            self.playImageView.image = #imageLiteral(resourceName: "play")
        }else{

            self.playImageView.image = #imageLiteral(resourceName: "1200px-Gtk-media-pause.svg")
            player.play()
        }
        isPlaying = !isPlaying
        
    }
}
