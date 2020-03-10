//
//  ProfileSettingsVC.swift
//  Tensend(new)
//
//  Created by root user on 3/9/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class ProfileSettingsVC: ScrollStackController {

    var profile : Profile?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Жеке ақпарат"
        
        let network = NetworkLayer()
        network.getProfile { (prof) in
            self.profile = prof?.profile
            self.setViews()
        }
    }

    static func open(vc: UIViewController) {
           let viewController = self.init()
           if let nav = vc.navigationController {
               nav.pushViewController(viewController, animated: true)
           }
       }
    

}


extension ProfileSettingsVC{
    func setViews(){
        let tFV = TextFieldView()
        tFV.label.text = "Есіміңіз"
        tFV.textField.text = self.profile?.name
        tFV.textField.autocapitalizationType = .words
        self.stackView.addArrangedSubview(tFV)
        
        let tFV1 = TextFieldView()
        tFV1.label.text = "Тегіңіз"
        tFV1.textField.text = self.profile?.fatherName
        tFV1.textField.autocapitalizationType = .words
        self.stackView.addArrangedSubview(tFV1)
        
        
        
        let tFV3 = TextFieldView()
        tFV3.label.text = "Электродные поштаңыз"
        tFV3.textField.text = self.profile?.fatherName
        tFV3.textField.autocapitalizationType = .words
        tFV3.textField.keyboardType = .emailAddress
        self.stackView.addArrangedSubview(tFV3)
        
        
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        button.setTitle("САҚТАУ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        
    }
}
