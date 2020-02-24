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
    var count = 15
    init(parrentVC: UIViewController) {
        super.init(frame: .zero)
        self.parrentVC = parrentVC
        setViewws()
    }
    
    func setViewws(){
        self.addSubview(stackView)
        stackView.easy.layout(Edges())
        stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        if (self.parrentVC as? CoursesVC) != nil {
            count = 3
        }
        for _ in 0..<self.count {
            let v = IconWithTitleView(parrentVC: parrentVC)
            v.addTapGestureRecognizer {
                CoursesByCategoryVC.open(vc: self.parrentVC)
            }
            v.dropShadowBlue()
            stackView.addArrangedSubview(v)
        }
        
        if (self.parrentVC as? CoursesVC) != nil {
            self.allButton()
        }
        
    }
    func allButton(){
        let allButton = UIButton()
        allButton.setTitle("Барлығы", for: .normal)
        allButton.titleLabel?.textAlignment = .center
        allButton.titleLabel?.font = .systemFont(ofSize: 14)
        allButton.setTitleColor(.gray, for: .normal)
        allButton.addTapGestureRecognizer {
            CoursesListVC.open(vc: self.parrentVC)
        }
        stackView.addArrangedSubview(allButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

