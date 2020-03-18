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
    
    var data: Data?
    var title = UILabel()
    var loadView = UIView()
    var loadViewBack = UIView()
    var subjectCountLabel = UILabel()
    let stackView = UIStackView()
    let icon = UIImageView()
    let container = UIView()
    init(data:Data) {
        super.init(frame: .zero)
        self.data = data
        
        size()
        self.dropShadowBlue()
        setData()
    }
    func setData(){
        
    }
    
    func size(){
        addSubview(container)
        container.addSubview(icon)
        container.addSubview(stackView)
        container.clipsToBounds = true
        container.easy.layout(Edges())
        icon.easy.layout(Top(),Left(),Bottom(),Right().to(stackView),Height(71),Width(88))
        icon.contentMode = .scaleToFill
        icon.layer.masksToBounds = true
        
        stackView.setProperties(axis: .vertical, alignment: .leading, spacing: 4, distribution: .fill)
        stackView.setSpacing(top: 5, left: 15, right: 0, bottom: 5)
        stackView.easy.layout(Top(),Bottom(),Right())
        stackViewSets()
        container.cornerRadius(radius: 8, width: 0)
        self.cornerRadius(radius: 8, width: 0)
        self.clipsToBounds = true
        self.backgroundColor = .white
    }
    
    func stackViewSets() {
        var titleText = ""
        if let tit = data?.title {
            titleText = tit
        }
        if let img = data?.imagePath, let url = URL(string: apiImgUrl + img.encodeUrl) {
            self.icon.sd_setImage(with: url, completed: nil)
        }
        title.setProperties(text: titleText, textColor: UIColor.titleDefault(UIColor())())
        stackView.addArrangedSubview(title)
        var sCountText = ""
        if let subjCount = data?.lessonsCount {
            sCountText = "\(subjCount)"
            subjectCountLabel.setProperties(text: "\(subjCount)", textColor: UIColor.titleDefault(UIColor())(), font: .systemFont(ofSize: 13))
        }
        if let data = self.data, data.started ?? false, data.lessonsPassingCount ?? 0 > 0 {
            if let allL = data.lessonsCount, let passL = data.lessonsPassingCount {
                sCountText = "\(allL) сабақтан \(passL)"
                subjectCountLabel.text = sCountText
            }
            isLoadView()
        } else {
            isauthor()
        }
       
        
        stackView.addArrangedSubview(subjectCountLabel)
    }
    
    func isauthor(){
        let authorLabel = UILabel()
        var authName = "Інжү Әнуарбекқызы"
        if let name = data?.author?.name {
            guard let surname = data?.author?.surname else {
                authName = name
            }
            authName = name + " \(surname)"
        }
        authorLabel.setProperties(text: authName, textColor: #colorLiteral(red: 0, green: 0.2823529412, blue: 0.8039215686, alpha: 1), font: .systemFont(ofSize: 10), numberLines: 1)
        stackView.addArrangedSubview(authorLabel)
    }
    
    func isLoadView(){
        loadViewBack.easy.layout(Width(65),Height(10))
        loadViewBack.layer.cornerRadius = 5
        loadView.layer.cornerRadius = 5
        loadViewBack.addSubview(loadView)
        loadView.easy.layout(Height(10),Top(),Bottom(),Left())
        if let d = data, let all = d.lessonsCount, let c = d.lessonsPassingCount , c > 0 {
            let w = CGFloat(Double(c) / Double(all) * 65.0)
            self.loadView.easy.layout(Width(w))
        }        
        loadViewBack.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 0.5)
        loadView.backgroundColor = #colorLiteral(red: 0, green: 0.8509803922, blue: 0.8039215686, alpha: 1)
        stackView.addArrangedSubview(loadViewBack)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
