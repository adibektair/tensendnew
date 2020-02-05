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
    override func awakeFromNib() {
        super.awakeFromNib()
        ava.layer.cornerRadius = 17
    }

}
