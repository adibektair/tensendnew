//
//  MeditationCVC.swift
//  Tensend
//
//  Created by Sultan on 2/10/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit

class MeditationCVC: UICollectionViewCell {
    
    var data : Data? {
        didSet {setData()}
    }
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.cornerRadius(radius: 5, width: 0, color: .white)
    }
    func setData(){
        if let img = data?.imgPath, let url = URL(string: apiImgUrl + img.encodeUrl) {
            self.img.sd_setImage(with: url, completed: nil)
        }
        if let name = data?.title {
            self.title.text = name
        }
        if let dTime = data?.durationTime {
            self.time.text = "\(dTime)" + "минут"
        }
    }
}
