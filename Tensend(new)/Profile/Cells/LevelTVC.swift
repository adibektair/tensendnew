//
//  LevelTVC.swift
//  Tensend(new)
//
//  Created by root user on 3/21/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import SDWebImage

class LevelTVC: UITableViewCell {

    var myId = Int()
    var level: Level?{
        didSet{
            guard let lvl = self.level else{
                return
            }
            if let logo = lvl.logo{
                self.logoImageView.sd_setImage(with: URL(string: imageUrl + logo.encodeUrl), completed: nil)
            }else{
                self.logoImageView.image = nil
            }
            self.titleLabel.text = lvl.name!
            self.descriptionLabel.text = lvl.descriptionField!
            if lvl.id! == self.myId{
                self.logoImageView.image = #imageLiteral(resourceName: "check")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var logoImageView: UIImageView!{
        didSet{
            self.logoImageView.cornerRadius(radius: 14, width: 0)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
