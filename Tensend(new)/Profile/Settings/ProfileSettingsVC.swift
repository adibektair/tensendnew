//
//  ProfileSettingsVC.swift
//  Tensend(new)
//
//  Created by root user on 3/9/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileSettingsVC: ScrollStackController {

    let tFV = TextFieldView()
    let tFV1 = TextFieldView()
    
    let network = NetworkLayer()

    var profile : Profile?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Жеке ақпарат"
        
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
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        tFV.label.text = "Есіміңіз"
        tFV.textField.text = self.profile?.name
        tFV.textField.autocapitalizationType = .words
        self.stackView.addArrangedSubview(tFV)
        
        tFV1.label.text = "Тегіңіз"
        tFV1.textField.text = self.profile?.surname
        tFV1.textField.autocapitalizationType = .words
        self.stackView.addArrangedSubview(tFV1)



        let view = UIView()
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        button.setTitle("САҚТАУ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(self.saveData), for: .touchUpInside)
        view.addSubview(button)
        button.easy.layout(Edges(20), Height(42))
        button.cornerRadius(radius: 8, width: 0)
        self.stackView.addArrangedSubview(view)

    }
    
    @objc func saveData(){
        if self.tFV.textField.text != nil && self.tFV.textField.text != ""
        && self.tFV1.textField.text != nil && self.tFV1.textField.text != ""
           {
           
            let params = [
                 "name" : tFV.textField.text! ,
                 "surname" : tFV1.textField.text! 
             ] as [String: AnyObject]
            
            network.setProfile(params: params) { (res) in
                if res?.success != nil && res!.success!{
                    self.showAlert(title: "Успешно", message: "Данные успешно сохранены")
                    
                }else{
                    self.showAlert(title: "Ошибка", message: "Попробуйте позже")
                }
            }
        }else{
            self.showAlert(title: "Қате", message: "Бүкіл ақпаратты толтырыңыз")
        }
    }
}
