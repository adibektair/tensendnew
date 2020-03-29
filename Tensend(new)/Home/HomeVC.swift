//
//  HomeVC.swift
//  Tensend
//
//  Created by Sultan on 1/26/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy

class HomeVC: ScrollStackController {
    
    let network = NetworkLayer()
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9803921569, alpha: 1)
        makeNCTranslucent()
        setElements()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        network.getProfile { (prof) in
            
            guard let name = prof?.profile?.name else{
                return
            }
            self.titleLabel.text = "Cәлеместіз бе, \(name)!"
        }
    }
    
    func setElements(){
        
        titleLabel.setProperties( textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), textAlignment: .center)
        titleLabel.setProperties(textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), font: .systemFont(ofSize: 20, weight: .medium), textAlignment: .center)
        titleLabel.text = "Cәлеместіз бе!"
        titleLabel.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackView.addArrangedSubview(titleLabel)
        
        let info = UILabel()
        let infoText = "Tensend-ке саяхаттап, өзіңіз үшін әлемнің шексіз білімін ашыңыз"
        info.setProperties(text: infoText, textColor: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1), textAlignment: .center, numberLines: 2)
        stackView.addArrangedSubview(info)
        let firstBanner = FirstBannerView()
        stackView.addArrangedSubview(firstBanner)
        addLine()
        let cats = CategoriesView()
        stackView.addArrangedSubview(cats)
        addLine()
        
        let section = SectionsName()
        section.setData(title: "СІЗ ҮШІН", desc: "Сізге ұнауы мүмкін сабақтар тізімі")
        stackView.addArrangedSubview(section)
        
        let forYou = ForYou()
        stackView.addArrangedSubview(forYou)
        
        
        let courseTitle = SectionsName()
        courseTitle.setData(title: "МЕНІҢ КУРСТАРЫМ", desc: "Сізге ұнайтын сабақтар тізімі")
        stackView.addArrangedSubview(courseTitle)
        
        let coursesList = MyCourses(parrentVC: self,id: 0,isMyCourses: true)
        stackView.addArrangedSubview(coursesList)
        addLine()
        
        let meditacion = SectionsName()
           meditacion.setData(title: "МЕДИТАЦИЯ", desc: "Бүгінгі күнге күш қуат пен энергия алыңыз")
           stackView.addArrangedSubview(meditacion)
        let meditationList = MeditationView()
        stackView.addArrangedSubview(meditationList)
        let bottomImage = UIImageView()
        bottomImage.image = #imageLiteral(resourceName: "bottomIMG")
        bottomImage.easy.layout(Height(379))
        stackView.addArrangedSubview(bottomImage)
        bottomImage.addTapGestureRecognizer {
            SubscribeVC.open(vc: self) { (item) in
                if item != nil {
                    self.view.paymentReq(item: item!)
                }
            }
        }
    }
    
    
}
