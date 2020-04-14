//
//  BeAnAuthorVC.swift
//  Tensend(new)
//
//  Created by root user on 4/10/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class BeAnAuthorVC: ScrollStackController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent(top: 10)
        self.title = "Автор болу"
        self.setView()
    }
    
    func setView(){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 60, distribution: .fill)
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "tensend_logo")
        let views = UIView()
        views.addSubview(imageView)
        self.stackView.addArrangedSubview(views)
        imageView.easy.layout(Center(), Width(70), Height(70))
        imageView.cornerRadius(radius: 10, width: 0)
        
        let textLabel = UILabel()
        textLabel.text = "Автор болу үшін сұрақтармен:\n+7 707 694 14 11 ватсапқа жазыңыз"
        textLabel.numberOfLines = 0
        textLabel.font = textLabel.font.withSize(15)
        textLabel.textAlignment = .center
        stackView.addArrangedSubview(textLabel)
    }

    static func open(vc: UIViewController) {
        let viewController = self.init()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
    

}
