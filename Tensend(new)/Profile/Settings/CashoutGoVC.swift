//
//  CashoutGoVC.swift
//  Tensend(new)
//
//  Created by root user on 3/11/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class CashoutGoVC: ScrollStackController {


    let network = NetworkLayer()
    var profile : Profile?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.additionalSafeAreaInsets.top = 0

        self.title = "Төлемдер мен табыс"
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 12, distribution: .fill)
        
        network.getProfile { (prof) in
            self.profile = prof?.profile
            self.setViews()
        }
        
    }
    
    @objc func goTo(){
        CashoutVC.open(vc: self)
    }
    static func open(vc: UIViewController) {
           let viewController = self.init()
           if let nav = vc.navigationController {
               nav.pushViewController(viewController, animated: true)
           }
       }
    
    func setViews(){
        let view = UIView()
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label.textAlignment = .left
        label.text = "Таза табыс"
        label.font = label.font.withSize(17)
        view.addSubview(label)
        label.easy.layout(Edges(20))
        self.stackView.addArrangedSubview(view)
        
        let view1 = UIView()
        let label1 = UILabel()
        label1.numberOfLines = 1
        label1.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label1.text = "\(self.profile!.balance!) тенге"
        label1.font = label.font.withSize(20)
        view1.addSubview(label1)
        label1.easy.layout(Edges(20))
        self.stackView.addArrangedSubview(view1)
               
        let view2 = UIView()
        let button = UIButton()
        button.backgroundColor = .clear
        button.cornerRadius(radius: 10, width: 1, color: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1))
        button.setTitle("КАРТАҒА ШЫҒАРУ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(20)
        button.addTarget(self, action: #selector(self.goTo), for: .touchUpInside)
        view2.addSubview(button)
        button.easy.layout(Height(71), Edges(30))
        self.stackView.addArrangedSubview(view2)


    }
}
