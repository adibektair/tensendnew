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
        
        tFV.label.text = "Комментарий"
        tFV.set(text: "Комментарий")
        
        tFV.textField.placeholder = "Комментарий"
        
        tFV.textField.autocapitalizationType = .sentences
        self.stackView.addArrangedSubview(tFV)
        
               
        tFV3.label.text = "Шығарылатын сомасы"
        tFV3.textField.placeholder = "Шығарылатын сомасы"
        tFV3.textField.autocapitalizationType = .words
        tFV3.textField.keyboardType = .numberPad
        self.stackView.addArrangedSubview(tFV3)
        
        let view = UIView()
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        button.setTitle("ӨТІНІШ ЖІБЕРУ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(self.saveData), for: .touchUpInside)
        view.addSubview(button)
        button.easy.layout(Edges(20), Height(42))
        button.cornerRadius(radius: 8, width: 0)
        self.stackView.addArrangedSubview(view)
    }
    @objc func saveData(){
        if self.tFV.textField.text != nil && tFV.textField.text != "" &&
                    self.tFV3.textField.text != nil && tFV3.textField.text != ""
        {
            let json = [
                "comment" : tFV.textField.text!, "amount" : tFV3.textField.text!] as [String : AnyObject]
            self.network.getCash(params: json) { (result) in
                if result?.success ?? false{
                    self.showAlert(title: "Рақмет", message: "Өтінішіңіз жіберілді")
                }else{
                    self.showAlert(title: "Қате", message: "Балансыңыздағы сома жеткіліксіз")
                }
            }
        }else{
            self.showAlert(title: "Назар аударыңыз", message: "Бүкіл ақпаратты толтырыңыз")
        }
    }
}
