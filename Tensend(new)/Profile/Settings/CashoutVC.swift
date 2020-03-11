//
//  CashoutVC.swift
//  Tensend(new)
//
//  Created by root user on 3/11/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import AKMaskField

class CashoutVC: ScrollStackController {

    var profile : Profile?
    let network = NetworkLayer()

    let tFV = TextFieldView()
    let tFV1 = TextFieldView()
    let tFV2 = TextFieldView()
    let tFV3 = TextFieldView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.additionalSafeAreaInsets.top = 0
        self.title = "Табысты шығару"
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
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
  

    
    func setViews(){
        let label = UILabel()
        label.text = "Табысты картаға шығарудың алдында,\nТөлемдердің жасалу тәсілдері мен ережелері\nмен таныс болыңыз."
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label.numberOfLines = 0
        self.stackView.addArrangedSubview(label)
        
        tFV.label.text = "Карта нөмірі"
        tFV.set(text: "Карта нөмірі")
        
        tFV.textField.placeholder = "****-****-****-****"
        tFV.textField.maskExpression = "{dddd}-{dddd}-{dddd}-{dddd}"
        tFV.textField.autocapitalizationType = .words
        self.stackView.addArrangedSubview(tFV)
        
        
        tFV1.label.text = "Есіміңіз"
        tFV1.textField.text = self.profile?.name
        tFV1.textField.autocapitalizationType = .words
        self.stackView.addArrangedSubview(tFV1)
        
        tFV2.label.text = "Тегіңіз"
        tFV2.textField.text = self.profile?.surname
        tFV2.textField.autocapitalizationType = .words
        self.stackView.addArrangedSubview(tFV2)

               
               
        tFV3.label.text = "Электродные поштаңыз"
        tFV3.textField.text = self.profile?.surname
        tFV3.textField.autocapitalizationType = .words
        tFV3.textField.keyboardType = .emailAddress
        self.stackView.addArrangedSubview(tFV3)
        
        let view = UIView()
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        button.setTitle("ОТІНІШ ЖІБЕРУ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(self.saveData), for: .touchUpInside)
        view.addSubview(button)
        button.easy.layout(Edges(20), Height(42))
        button.cornerRadius(radius: 8, width: 0)
        self.stackView.addArrangedSubview(view)
    }
    @objc func saveData(){
        if self.tFV.textField.text != nil && tFV.textField.text != "" &&
            self.tFV.textField.text != nil && tFV.textField.text != ""{}
    }
}
