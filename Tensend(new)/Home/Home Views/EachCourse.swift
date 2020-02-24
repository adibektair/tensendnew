//
//  EachCourse.swift
//  Tensend
//
//  Created by Sultan on 2/9/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy

class EachCourse: UIView {
    
    var title = UILabel()
    var loadView = UIView()
    var loadViewBack = UIView()
    var subjectCountLabel = UILabel()
    let stackView = UIStackView()
    let icon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        size()
        setData()
    }
    func setData(){
        let a = 24.0
        let b = 8.0
        let c = b / a * 65.0
        loadView.easy.layout(Width(CGFloat(c)))
        icon.image = #imageLiteral(resourceName: "eachCourse")
//        icon.layer.masksToBounds = true
//        icon.layer.borderWidth = 1
//        self.backgroundColor = .white
        self.dropShadowBlue()
    }
    
    func size(){
        addSubview(icon)
        addSubview(stackView)
        
        icon.easy.layout(Top(),Left(),Bottom(),Right().to(stackView),Height(71),Width(88))
        
        stackView.setProperties(axis: .vertical, alignment: .leading, spacing: 4, distribution: .fill)
        stackView.setSpacing(top: 5, left: 15, right: 0, bottom: 5)
        stackView.easy.layout(Top(),Bottom(),Right())
        stackViewSets()
        self.cornerRadius(radius: 8, width: 0)
        self.backgroundColor = .white
//        self.clipsToBounds = true
        //        self.dropShadow(color: UIColor.titleDefault(UIColor())(), opacity: 1, offSet: CGSize(width: 01, height: 1), radius: 3, scale: true)
    }
    
    func stackViewSets() {
        
        title.setProperties(text: "Сымбатты мүсін", textColor: UIColor.titleDefault(UIColor())())
        stackView.addArrangedSubview(title)
        if true {
            isauthor()
        } else {
            isLoadView()
        }
        
        subjectCountLabel.setProperties(text: "24 сабақтан 4", textColor: UIColor.titleDefault(UIColor())(), font: .systemFont(ofSize: 13))
        stackView.addArrangedSubview(subjectCountLabel)
    }
    
    func isauthor(){
        let authorLabel = UILabel()
        let authName = "Інжү Әнуарбекқызы"
        authorLabel.setProperties(text: authName, textColor: #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1), font: .systemFont(ofSize: 10), numberLines: 1)
        stackView.addArrangedSubview(authorLabel)
    }
    
    func isLoadView(){
        loadViewBack.easy.layout(Width(65),Height(10))
        loadViewBack.layer.cornerRadius = 5
        loadView.layer.cornerRadius = 5
        loadViewBack.addSubview(loadView)
        loadView.easy.layout(Height(10),Top(),Bottom(),Left())
        loadViewBack.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 0.5)
        loadView.backgroundColor = #colorLiteral(red: 0, green: 0.8509803922, blue: 0.8039215686, alpha: 1)
        stackView.addArrangedSubview(loadViewBack)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
