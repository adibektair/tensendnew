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
        let titleLabel = UILabel()
        titleLabel.setProperties(text: "Tensend-тің барлық курстарын ашыңыз!", textColor: #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.2431372549, alpha: 1), font: .systemFont(ofSize: 21, weight: .semibold), textAlignment: .center, numberLines: 0)
        stackView.addArrangedSubview(titleLabel)
     
        for i in texts {
            let a = horizontStack(text: i)
            stackView.addArrangedSubview(a)
        }
        let infoLabel = UILabel()
        infoLabel.setProperties(text: "Өзіңізге қолайлы пакетті таңдағыз", textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), font: .systemFont(ofSize: 14), textAlignment: .center, numberLines: 2)
        stackView.addArrangedSubview(infoLabel)
        
      
    }

    func horizontStack(text:String) -> UIStackView {
        let s = UIStackView()
        s.setProperties(axis: .horizontal, alignment: .fill, spacing: 20, distribution: .fill)
        let icon = UIImageView()
        icon.easy.layout(Height(26),Width(26))
        s.addArrangedSubview(icon)
        
        let title = UILabel()
        title.setProperties(text: text, textColor: #colorLiteral(red: 0.2431372549, green: 0.2431372549, blue: 0.2431372549, alpha: 1), font: .systemFont(ofSize: 16, weight: .medium), numberLines: 0)
        s.addArrangedSubview(title)
        
        return s
    }

}
