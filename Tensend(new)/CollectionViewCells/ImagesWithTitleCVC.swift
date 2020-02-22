//
//  imagesWithTitleCVC.swift
//  Tensend
//
//  Created by Sultan on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit

class ImagesWithTitleCVC: UICollectionViewCell {

    var categoryData : Data? {
        didSet {setData()}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backView.layer.cornerRadius = 29
        self.backView.layer.borderWidth = 2
        self.backView.layer.borderColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 0.13)
        self.backgroundColor = .clear
    }
    func setData(){
        if let img = categoryData?.imgPath, let url = URL(string: apiImgUrl + img.encodeUrl) {
            self.img.sd_setImage(with: url, completed: nil)
        }
        if let name = categoryData?.name {
            self.title.text = name
        }
    }

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backView: UIView!
    
}
