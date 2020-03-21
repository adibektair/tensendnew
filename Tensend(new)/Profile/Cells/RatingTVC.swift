//
//  RatingTVC.swift
//  Tensend(new)
//
//  Created by root user on 3/17/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import SDWebImage

class RatingTVC: UITableViewCell {

    var data : Rating?{
        didSet{
            if let rating = self.data?.rating{
                self.amountLabel.text = String(rating)
            }else{
                self.amountLabel.text = "0"
            }
            
            if let surname = self.data?.surname{
                self.nameLabel.text = surname + " "
            }
            if let name = self.data?.name{
                self.nameLabel.text = self.nameLabel.text! + name
            }
            if let image = self.data?.imagePath{
                self.avatarImageView.sd_setImage(with: URL(string: imageUrl + image.encodeUrl), completed: nil)
            }else{
                self.avatarImageView.image = #imageLiteral(resourceName: "depositphotos_137014128-stock-illustration-user-profile-icon")
            }
            if let logo = self.data?.logo{
                self.logoImageView.sd_setImage(with: URL(string: imageUrl + logo.encodeUrl), completed: nil)
            }else{
                self.logoImageView.image = nil
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var avatarImageView: UIImageView!{
        didSet{
            self.avatarImageView.cornerRadius(radius: Int(20), width: 1)
            self.avatarImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
