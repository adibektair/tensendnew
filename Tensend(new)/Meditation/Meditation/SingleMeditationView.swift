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
import Cosmos
import EasyPeasy

class SingleMeditationView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var isPlaying = false
    var presenter : SingleMeditationPresenterProtocol?
    var player: AVPlayer!
    var selectedAuthorIndex = 0
    var finishView = UIView()
    let cosmosView = CosmosView()
    let network = NetworkLayer()
    let button = UIButton()
    var rated = false
    
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            self.collectionView.isHidden = true
        }
    }
    @IBOutlet weak var meditationNameLabel: UILabel!{
        didSet{
            self.meditationNameLabel.isHidden = true
        }
    }
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
        let btnShare = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(btnShare_clicked))
        self.navigationItem.rightBarButtonItem = btnShare
    }


    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        player.pause()
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
        self.collectionView.reloadData()
        let audio = self.presenter?.meditation?.meditation?.audios?[indexPath.row]
        let url = URL.init(string: imageUrl + audio!.audioPath!)
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.meditation?.meditation?.audios?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
    @objc func btnShare_clicked() {
        print("Share button clicked")
    }
    
    func setProgressBar(){
        guard let item = self.player.currentItem else{
            return
        }
        self.sliderView.maximumValue = Float(item.asset.duration.seconds)
    }
    @IBAction func forward(_ sender: Any) {
        guard let item = self.player.currentItem else{
            return
        }
        let time = CMTimeMake(value: Int64(item.currentTime().seconds + 15.0), timescale: 1)
        self.player.seek(to: time)
    }
    @IBAction func backward(_ sender: Any) {
        guard let item = self.player.currentItem else{
            return
        }
        let time = CMTimeMake(value: Int64(item.currentTime().seconds - 15.0), timescale: 1)
        self.player.seek(to: time)
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
        self.setProgressBar()


        self.playView.addTapGestureRecognizer {
            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.fireTimer), userInfo: nil, repeats: true)
            self.play()
        }
        let cosmosView = CosmosView()
        cosmosView.rating = Double(self.presenter?.meditation?.meditation?.scale ?? 0)
        self.view.addSubview(cosmosView)
        cosmosView.easy.layout(Leading(0).to(self.dictorImageView), Top(5).to(self.dictorImageView), Width(50), Height(20))
        
    }
    
    
    @objc func fireTimer() {
        guard let item = self.player.currentItem else{
            return
        }
        self.sliderView.setValue(Float(item.currentTime().seconds), animated: true)
        self.timerLabel.text = formatTime(seconds: item.asset.duration.seconds - item.currentTime().seconds)
        
    }
    
  func formatTime(seconds: Double) -> String {
      let result = timeDivider(seconds: seconds)
      let hoursString = "\(result.hours)"
      var minutesString = "\(result.minutes)"
      var secondsString = "\(result.seconds)"

      if minutesString.count == 1 {
          minutesString = "0\(result.minutes)"
      }
      if secondsString.count == 1 {
          secondsString = "0\(result.seconds)"
      }

      var time = "\(hoursString):"
      if result.hours >= 1 {
          time.append("\(minutesString):\(secondsString)")
      }
      else {
          time = "\(minutesString):\(secondsString)"
      }
      return time
  }
    
    func timeDivider(seconds: Double) -> (hours: Int, minutes: Int, seconds: Int) {
        guard !(seconds.isNaN || seconds.isInfinite) else {
            return (0,0,0)
        }
        let secs: Int = Int(seconds)
        let hours = secs / 3600
        let minutes = (secs % 3600) / 60
        let seconds = (secs % 3600) % 60
        return (hours, minutes, seconds)
    }
    
    func play(){
      
        
        if isPlaying{
            player.pause()
            self.playImageView.image = #imageLiteral(resourceName: "play")
        }else{
            
            self.playImageView.image = #imageLiteral(resourceName: "pause.png")
            self.playImageView.backgroundColor = .white
            self.setUpFinish()
            player.play()
        }
        isPlaying = !isPlaying
        
    }
    
    func setUpFinish(){
        self.view.addSubview(finishView)
        finishView.backgroundColor = .white
        self.finishView.easy.layout(Height(UIScreen.main.bounds.height / 2), Left(), Right(), Bottom())
        finishView.cornerRadius(radius: 25, width: 0)
        let stackView = UIStackView()
        stackView.setProperties(axis: .vertical, alignment: .center, spacing: 10, distribution: .equalCentering)
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textColor = .black
        label.text = "Медитация аяқталды!"
        label.textAlignment = .center
        stackView.addArrangedSubview(label)
        
        let label1 = UILabel()
        label1.font = label1.font.withSize(16)
        label1.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label1.text = "Медитацияға бағаңызды\nқойыңыз"
        label1.numberOfLines = 0
        label1.textAlignment = .center
        stackView.addArrangedSubview(label1)
        
        let v1 = UIView()
        v1.addSubview(cosmosView)
        cosmosView.easy.layout(Edges(), Height(30), Width(70), CenterX())
        stackView.addArrangedSubview(cosmosView)
        
        button.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        button.cornerRadius(radius: 10, width: 0)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Жіберу", for: .normal)
        let v = UIView()
        v.addSubview(button)
        button.easy.layout(Edges(20), Height(55), Width(250))
        button.addTarget(self, action: #selector(self.rate), for: .touchUpInside)
        stackView.addArrangedSubview(v)
        finishView.addSubview(stackView)
        stackView.easy.layout(Edges())
    }
    
    @objc func rate(){
        if rated{
            self.navigationController?.popToRootViewController(animated: true)
            return
        }else{
            let json = ["meditation_id" : self.presenter!.id,
                        "scale" : self.cosmosView.rating] as [String : AnyObject]
            self.network.rateMeditation(params: json) { (response) in
                if response?.success ?? false{
                    self.showAlert(title: "Рақмет", message: "Бағаңыз қабылданды")
                    self.button.setTitle("Жалғастыру", for: .normal)
                    self.rated = true
                }else{
                    self.showAlert(title: "Sorry", message: "Some error occured")
                }
            }
            
        }
        
    }
}
