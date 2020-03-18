//
//  ThreeButtons.swift
//  Tensend(new)
//
//  Created by root user on 3/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class ThreeButtons: UIView {

    var stackView = UIStackView()
    var leftButton = UIButton()
    var rightButton = UIButton()
    var centerButton = UIButton()
    
    init(leftPressed: (() -> Void)?,
         rightPressed: (() -> Void)?,
         centedPressed: (() -> Void)?) {
        
        super.init(frame: .zero)
        self.setViews()
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 3, distribution: .fillEqually)
        
        leftButton.addTapGestureRecognizer {
            leftPressed!()
              self.leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
              self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
              self.centerButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)

          }
        
        rightButton.addTapGestureRecognizer {
            rightPressed!()
            self.leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            self.centerButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        }
        
        centerButton.addTapGestureRecognizer {
            centedPressed!()
            self.leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            self.centerButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
        
    }
    
    func setViews() {
           self.backgroundColor = .white
           self.cornerRadius(radius: 7, width: 0)
           addSubview(stackView)
           self.dropShadowBlue()
           stackView.easy.layout(Bottom(),Top(),Left(8),Right(8))
           leftButton.setTitle("СТАТИСТИКА", for: .normal)
           leftButton.setTitleColor(.black, for: .normal)
           leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
           leftButton.backgroundColor = .white
           
        centerButton.setTitle("САТУ", for: .normal)
              centerButton.setTitleColor(.black, for: .normal)
              centerButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
              centerButton.backgroundColor = .white
        
           rightButton.setTitle("МАРКЕТИНГ", for: .normal)
           rightButton.setTitleColor(.black, for: .normal)
           rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
           rightButton.backgroundColor = .white
        
   
             
        
           
           stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(centerButton)
           stackView.addArrangedSubview(rightButton)
            

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
