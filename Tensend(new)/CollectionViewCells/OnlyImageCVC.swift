//
//  OnlyImageCVC.swift
//  Tensend
//
//  Created by Sultan on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy
class OnlyImageCVC: UICollectionViewCell {
    let image = UIImageView()
    var data : Banner? { didSet { setData() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        self.image.easy.layout(Edges())
        self.layer.cornerRadius = 8
        self.cornerRadius(radius: 8, width: 0, color: .white)
    }
    func setData(){
        if let img = data?.imagePath, let url = URL(string: apiImgUrl + img.encodeUrl) {
              self.image.sd_setImage(with: url, completed: nil)
          }
      }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
