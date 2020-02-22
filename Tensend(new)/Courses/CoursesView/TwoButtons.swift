//
//  TwoButtons.swift
//  Tensend(new)
//
//  Created by Sultan on 2/22/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class TwoButtons: UIView {
  
    var parrentVC = UIViewController()
    var stackView = UIStackView()
    var leftButton = UIButton()
    var rightButton = UIButton()
    
     init(parrentVC: UIViewController,
          leftPressed: (() -> Void)?,
          rightPressed: (() -> Void)?) {
        super.init(frame: .zero)
        self.parrentVC = parrentVC
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 8, distribution: .fillEqually)
        setViews()
        leftButton.addTapGestureRecognizer(action: leftPressed)
        rightButton.addTapGestureRecognizer(action: rightPressed)
     }
    func set( action: (() -> Void)?,
              ll: (() -> Void)?){

    }
     
    func setViews() {
        addSubview(stackView)
        stackView.easy.layout(Edges(10))
        stackView.dropShadowBlue()
        leftButton.easy.layout(Height(44))
        rightButton.easy.layout(Height(44))
        
        leftButton.setTitle("Барлығы", for: .normal)
        leftButton.setTitleColor(.black, for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        rightButton.setTitle("ОҚУ БАРЫСЫНДА", for: .normal)
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(rightButton)
    }
    @objc func righPressed(_ sender:UIButton){
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
