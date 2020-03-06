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
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 3, distribution: .fillEqually)
        setViews()
        leftButton.addTapGestureRecognizer {
            leftPressed!()
            self.leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        }
        rightButton.addTapGestureRecognizer{
            rightPressed!()
            self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            self.leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        }
    }
    
    
    func setViews() {
        self.backgroundColor = .white
        self.cornerRadius(radius: 15, width: 0)
        addSubview(stackView)
        self.dropShadowBlue()
        stackView.easy.layout(Bottom(),Top(),Left(8),Right(8))
        leftButton.easy.layout(Height(44))
        rightButton.easy.layout(Height(44))
        
        leftButton.setTitle("Барлығы", for: .normal)
        leftButton.setTitleColor(.black, for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        leftButton.backgroundColor = .white
        
        rightButton.setTitle("ОҚУ БАРЫСЫНДА", for: .normal)
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        rightButton.backgroundColor = .white
        
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(rightButton)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
