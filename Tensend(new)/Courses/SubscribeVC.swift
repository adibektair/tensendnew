//
//  SubscribeVC.swift
//  Tensend(new)
//
//  Created by Sultan on 3/16/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class SubscribeVC: ScrollStackController {

    var object: SubscriptionTypeResponse?
    var subscriptionType: ((_ nameChanged: SubscriptionType?) -> Void)?
    let texts = ["300+ аудио және видео материалдар",
    "100+ медитация және сабақтар",
    "Серіктес болу арқылы апта сайын табыс табу мүмкіндігі",
    "Өміріңізді түбегейлі өзгертетін сабақтар",
    "Автокөлік және де шет елге саяхатқа жолдама ұтыс ойындарына қатысу мүмкіндігі"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrangedSubViews()
    }
    
    func arrangedSubViews() {
        stackView.setSpacing(top: 55, left: 30, right: 30, bottom: 50)
        let titleLabel = UILabel()
        titleLabel.setProperties(text: "Tensend-тің барлық курстарын ашыңыз!", textColor: #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.2431372549, alpha: 1), font: .systemFont(ofSize: 21, weight: .semibold), textAlignment: .center, numberLines: 0)
        stackView.addArrangedSubview(titleLabel)
        stackView.addCustomSpacing(50, after: titleLabel)
        for i in texts {
            let a = horizontStack(text: i)
            stackView.addArrangedSubview(a)
        }
        let infoLabel = UILabel()
        infoLabel.setProperties(text: "Өзіңізге қолайлы пакетті таңдаңыз", textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), font: .systemFont(ofSize: 14), textAlignment: .center, numberLines: 2)
        stackView.addArrangedSubview(infoLabel)
        getSubscription()
    }

    func horizontStack(text:String) -> UIStackView {
        let s = UIStackView()
        s.setProperties(axis: .horizontal, alignment: .fill, spacing: 20, distribution: .fill)
        let iconStack = UIStackView()
        iconStack.setProperties(axis: .vertical, alignment: .fill, spacing: 0, distribution: .fill)
        
        let icon = UIImageView()
        icon.image = #imageLiteral(resourceName: "check")
        icon.easy.layout(Height(26),Width(26))
        iconStack.addArrangedSubview(icon)
        iconStack.addArrangedSubview(UIView())
        s.addArrangedSubview(iconStack)
        
        let title = UILabel()
        title.setProperties(text: text, textColor: #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.2431372549, alpha: 1), font: .systemFont(ofSize: 16, weight: .medium), numberLines: 5)
        s.addArrangedSubview(title)
        
        return s
    }
    func payButtons(){
        if let types = self.object?.subscriptionTypes {
            for i in 0..<types.count {
                let s = UIView()
                let v = UIStackView()
                var borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
                s.addSubview(v)
                v.easy.layout(Edges(10))
                s.addTapGestureRecognizer {
                    
                }
                v.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
                v.setSpacing(top: 15, left: 0, right: 0, bottom: 15)
                let title = UILabel()
                title.setProperties(text: types[i].name ?? "", textColor: .black, textAlignment: .center, numberLines: 2)
                let price = UILabel()
                price.setProperties(text: "\(types[i].price ?? 0)", textColor: .black, textAlignment: .center)
                v.addArrangedSubview(title)
                v.addArrangedSubview(price)
                if i % 2 == 0 {
                    borderColor = #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1)
                    s.backgroundColor = borderColor
                    price.textColor = .white
                    title.textColor = .white
                }
                s.cornerRadius(radius: 10, width: 1,color: borderColor)
                self.stackView.addArrangedSubview(s)
            }
        }
    }
    
    func pay(item: SubscriptionType){
        self.dismiss(animated: true) {
            
        }
    }
    
    func getSubscription(){
        HomeRequests.sharedInstance.getSubscriptions { (result) in
            self.object = result
            self.payButtons()
        }
    }
    
    static func open(vc: UIViewController, subscriptionType: ((_ nameChanged: SubscriptionType?) -> Void)? = nil ) {
           let renameVC = SubscribeVC()
           renameVC.subscriptionType = subscriptionType
           if let nav = vc.navigationController {
               nav.pushViewController(renameVC, animated: true)
           }
       }

}
