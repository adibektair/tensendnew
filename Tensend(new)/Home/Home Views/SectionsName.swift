//
//  ForYouView.swift
//  Tensend
//
//  Created by Sultan on 2/3/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy

class SectionsName: UIView {

    let dotView = UIView()
    let titleContainer = UIView()
    let title = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        size()
        setData()
    }
    func setData(title:String, desc:String){
        self.title.text = title
        self.descriptionLabel.text = desc
    }
    func size(){
        self.addSubview(titleContainer)
        titleContainer.easy.layout(Edges())
        titleContainer.addSubview(dotView)
        titleContainer.addSubview(title)
        titleContainer.addSubview(descriptionLabel)
        dotView.easy.layout(Width(10),Height(10),Left(30),CenterY().to(title),Right(10).to(title))
        title.easy.layout(Top(10),Left(>=10))
        descriptionLabel.easy.layout(Left(30), Top(5).to(title),Bottom(10))
        dotView.backgroundColor = .blue
        dotView.layer.cornerRadius = 5
    }
    func setData(){
        let color = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        title.setProperties(textColor: color,font: .systemFont(ofSize: 19, weight: .medium), textAlignment: .left)
        descriptionLabel.setProperties( textColor: color, font: .systemFont(ofSize: 15), textAlignment: .left)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

