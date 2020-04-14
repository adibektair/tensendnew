//
//  AboutTensendVC.swift
//  Tensend(new)
//
//  Created by root user on 4/10/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class AboutTensendVC: ScrollStackController {

    var aboutTensend : AboutTensend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent(top: 10)
        self.title = "Tensend жайлы"
        let network = NetworkLayer()
        network.getAboutTensend { (about) in
            self.aboutTensend = about
            self.setView()
        }
    }
    
    func setView(){
         self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 20, distribution: .fill)
         let imageView = UIImageView()
         imageView.image = #imageLiteral(resourceName: "tensend_logo")
         let views = UIView()
         views.addSubview(imageView)
         self.stackView.addArrangedSubview(views)
         imageView.easy.layout(Top(20), Center(), Width(70), Height(70))
         imageView.cornerRadius(radius: 10, width: 0)
         
         let textLabel = UILabel()
        textLabel.text = self.aboutTensend?.tensend?.title ?? ""
         textLabel.numberOfLines = 0
         textLabel.font = textLabel.font.withSize(15)
         textLabel.textAlignment = .center
         stackView.addArrangedSubview(textLabel)
        
        
         let textLabel1 = UILabel()
         textLabel1.text = self.aboutTensend?.tensend?.address ?? ""
         textLabel1.numberOfLines = 0
         textLabel1.font = textLabel.font.withSize(15)
         textLabel1.textAlignment = .center
         stackView.addArrangedSubview(textLabel1)
        
        
        let textLabel2 = UILabel()
        textLabel2.text = self.aboutTensend?.tensend?.aboutUs ?? ""
        textLabel2.numberOfLines = 0
        textLabel2.font = textLabel.font.withSize(15)
        textLabel2.textAlignment = .center
        stackView.addArrangedSubview(textLabel2)
        self.stackView.spacing = 0

        for item in self.aboutTensend!.tensend!.links!{
            let view = FAQView()
            view.questionLabel.text = item.title ?? ""
            view.questionLabel.textAlignment = .center
            view.addTapGestureRecognizer {
                guard let url = item.url else{
                    return
                }
                guard let urlLink = URL(string: url) else { return }
            UIApplication.shared.open(urlLink)
            }
            self.stackView.addArrangedSubview(view)
        }
        self.stackView.spacing = 20
        
        let textLabel3 = UILabel()
        textLabel3.text = self.aboutTensend?.tensend?.copyright ?? ""
        textLabel3.numberOfLines = 0
        textLabel3.font = textLabel.font.withSize(15)
        textLabel3.textAlignment = .center
        stackView.addArrangedSubview(textLabel3)
        
     }
    static func open(vc: UIViewController) {
          let viewController = self.init()
          if let nav = vc.navigationController {
              nav.pushViewController(viewController, animated: true)
          }
      }

}
