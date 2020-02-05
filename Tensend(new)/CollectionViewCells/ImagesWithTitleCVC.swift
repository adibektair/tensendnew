//
//  imagesWithTitleCVC.swift
//  Tensend
//
//  Created by Sultan on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit

class ImagesWithTitleCVC: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.img.layer.cornerRadius = 29
        self.img.layer.borderWidth = 2
        self.img.layer.borderColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 0.13)
        self.backgroundColor = .clear
    }

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
}
