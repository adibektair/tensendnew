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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        self.image.easy.layout(Edges())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
