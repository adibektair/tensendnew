//
//  ProfileVC.swift
//  Tensend(new)
//
//  Created by root user on 3/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileVC: ScrollStackController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        self.setUpView()
    }
    


}
extension ProfileVC{
    func setUpView(){
        let buttonStackView = UIStackView()
        buttonStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 0, distribution: .fill)
        buttonStackView.setSpacing(right: 20)
        buttonStackView.addArrangedSubview(UIView())
        let settingsButton = UIButton()
        settingsButton.setImage(#imageLiteral(resourceName: "Exclusion 1"), for: .normal)
        buttonStackView.addArrangedSubview(settingsButton)
        settingsButton.easy.layout(Height(20), Width(20))
        self.stackView.addArrangedSubview(buttonStackView)
        
    }
    
    
}
