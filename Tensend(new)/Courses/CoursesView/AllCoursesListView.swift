//
//  AllCoursesListView.swift
//  Tensend(new)
//
//  Created by Sultan on 2/23/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class AllCoursesListView: UIView {
    
    var parrentVC = UIViewController()
    var stackView = UIStackView()
    
    init(parrentVC: UIViewController) {
        super.init(frame: .zero)
        self.parrentVC = parrentVC
        setViewws()
    }
    
    func setViewws(){
        self.addSubview(stackView)
        stackView.easy.layout(Edges())
        stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        for _ in 0..<10 {
            let v = IconWithTitleView(parrentVC: parrentVC)
            v.dropShadowBlue()
            stackView.addArrangedSubview(v)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

