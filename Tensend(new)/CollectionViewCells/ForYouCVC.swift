//
//  ForYouCVC.swift
//  Tensend
//
//  Created by Sultan on 2/3/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit

class ForYouCVC: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ava: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    var data : Data? {
          didSet {setData()}
      }
    override func awakeFromNib() {
        super.awakeFromNib()
        ava.layer.cornerRadius = 17
    }
    func setData(){
          if let img = data?.imagePath, let url = URL(string: apiImgUrl + img.encodeUrl) {
              self.img.sd_setImage(with: url, completed: nil)
          }
          if let name = data?.title {
              self.title.text = name
          }
        if let name = data?.author?.name {
            self.name.text = name
          }
        if let ava = data?.author?.imagePath, let url = URL(string: apiImgUrl + ava.encodeUrl) {
            self.ava.sd_setImage(with: url, completed: nil)
        }
      }

}
