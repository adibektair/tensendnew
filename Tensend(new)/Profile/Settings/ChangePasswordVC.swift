//
//  ChangePasswordVC.swift
//  Tensend(new)
//
//  Created by root user on 4/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class ChangePasswordVC: ScrollStackController{
    
    var currentPasswordView = TextFieldView()
    var newPasswordView = TextFieldView()
    var repeatPasswordView = TextFieldView()
    let networkLayer = NetworkLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.title = "Құпия сөз"
        self.setViews()
    }
    
    
    func setViews(){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        currentPasswordView.set(text: "Құпия сөз")
        currentPasswordView.textField.isSecureTextEntry = true
        newPasswordView.set(text: "Жаңа құпия сөз")
        newPasswordView.textField.isSecureTextEntry = true
        repeatPasswordView.set(text: "Жаңа құпия сөзді қайталаңыз")
        repeatPasswordView.textField.isSecureTextEntry = true
        self.stackView.addArrangedSubview(currentPasswordView)
        self.stackView.addArrangedSubview(newPasswordView)
        self.stackView.addArrangedSubview(repeatPasswordView)
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
        if self.currentPasswordView.textField.text != nil && self.currentPasswordView.textField.text != "" &&
            self.newPasswordView.textField.text != nil && self.newPasswordView.textField.text != "" &&
            self.repeatPasswordView.textField.text != nil && self.repeatPasswordView.textField.text != ""{
            if self.newPasswordView.textField.text != self.repeatPasswordView.textField.text{
                self.showAlert(title: "Қате", message: "Сіз енгізген жаңа құпия сөз дұрыс емес")
                return
            }
            let data = ["password" : self.currentPasswordView.textField.text!, "new_password" : self.newPasswordView.textField.text!] as [String : AnyObject]
            self.networkLayer.resetPasswordByToken(params: data) { (response) in
                Helper.shared().makeUserResponse(response: response!) { (success, message) in
                    self.showAlert(title: success, message: message, popToRoot: true)
                    
                }
            }

            
        }else{
            self.showAlert(title: "Назар аударыңыз", message: "Бүкіл ақпаратты толтырыңыз")
        }
    }
    
    static func open(vc: UIViewController) {
        let viewController = self.init()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
