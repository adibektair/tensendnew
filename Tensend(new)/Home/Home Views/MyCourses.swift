//
//  MyCourses.swift
//  Tensend
//
//  Created by Sultan on 2/9/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
import EasyPeasy

class MyCourses: UIView {

    let stackview = UIStackView()
    let allButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        size()
    }
    
    func size() {
        stackview.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        stackview.setSpacing(top: 0, left: 30, right: 30, bottom: 10)
        self.addSubview(stackview)
        allButton.setTitle("Барлығы", for: .normal)
        allButton.setTitleColor(#colorLiteral(red: 0.2039215686, green: 0.6509803922, blue: 0.337254902, alpha: 1), for: .normal)
        let a = EachCourse()
        let b = EachCourse()
        let c = EachCourse()
        stackview.addArrangedSubview(a)
        stackview.addArrangedSubview(b)
        stackview.addArrangedSubview(c)
        addSubview(stackview)
        addSubview(allButton)
        stackview.easy.layout(Top(),Left(),Right(),Bottom().to(allButton))
        allButton.easy.layout(Left(30),Bottom())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
