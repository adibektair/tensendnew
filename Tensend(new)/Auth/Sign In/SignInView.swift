//
//  SignInView.swift
//  Tensend(new)
//
//  Created by root user on 2/18/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy

class SignInView: ScrollStackController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        self.createTopView()
        self.createMiddleView()
        
    }
    
    
    
}
extension SignInView{
    func createTopView(){
        let view = UIView()
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Монтажная область -1")
        view.addSubview(image)
        image.easy.layout(Top(), Bottom(), Left(), Right())
        let logoImageView = UIImageView()
        logoImageView.image = #imageLiteral(resourceName: "Path 10")
        view.addSubview(logoImageView)
        logoImageView.easy.layout(Center(), Height(81), Width(105))
        let label = UILabel()
        label.text = "Tensend"
        label.textColor = .white
        view.addSubview(label)
        label.easy.layout(Top(10).to(logoImageView), CenterX().to(logoImageView))
        stackView.addArrangedSubview(view)
        view.easy.layout(Top(), Left(), Right(), Height(UIScreen.main.bounds.height * 0.33))
    }
    
    func createMiddleView(){
        let view = UIView()
        let label = UILabel()
        label.text = "Аккаунтыңызға кіріңіз"
        label.font = label.font.withSize(20)
        label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label.textAlignment = .center
        view.addSubview(label)
        label.easy.layout(Top(50), CenterX(), Height(20),Top(),Bottom())
        stackView.addArrangedSubview(view)
        
        let view2 = UIView()
        let label1 = UILabel()
        label1.text = "Tensend тегі өз жеке\nаккаунтыңызға кіру үшін логин\nмен құпия сөзді еңгізіңіз"
        label1.font = UIFont(name: "Montserrat-Regular", size: 16)
        label1.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        label1.numberOfLines = 0
        label1.textAlignment = .center
        view2.addSubview(label1)
        label1.easy.layout(Top(20), CenterX(), Left(30), Right(30),Bottom())
        stackView.addArrangedSubview(view2)
//        self.createTextFieldsView()
        self.textFieldViewBySultan()
    }
    
    func createTextFieldsView(){
        
        let tfView = UIView()
        tfView.backgroundColor = .white
        tfView.cornerRadius(radius: 15, width: 0, color: .white)
        
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "E-mail немесе телефон нөміріңіз"
        textField.textColor = .black
        tfView.addSubview(textField)
        textField.easy.layout(Top(5), Left(10), Right(10))
        let borderLine = UIView()
        borderLine.backgroundColor = .gray
        tfView.addSubview(borderLine)
        borderLine.easy.layout(CenterY().to(tfView), Left(), Right(), Height(1))
        
        let textField1 = UITextField()
        textField1.borderStyle = .none
        textField1.placeholder = "Құпия сөз"
        textField1.textColor = .black
        tfView.addSubview(textField1)
        textField1.easy.layout(Top(5).to(borderLine), Left(10), Width(100))
        
        let button = UIButton()
        button.setTitle("ЕСКЕ ТҮСІРУ", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        tfView.addSubview(button)
        button.easy.layout(Left(10), CenterX().to(textField1), Width(100))
        tfView.easy.layout( Left(20), Right(20), Height(50))
        
        stackView.addArrangedSubview(tfView)
    }
    func textFieldViewBySultan(){
        let textStackView = UIStackView()
        textStackView.setProperties(axis: .vertical, alignment: .fill, spacing: 0, distribution: .fill)
        
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "E-mail немесе телефон нөміріңіз"
        textField.textColor = .black
        textStackView.addArrangedSubview(textField)
        
        let borderLine = UIView()
        borderLine.backgroundColor = .gray
        borderLine.easy.layout(Height(1))
        textStackView.addArrangedSubview(borderLine)
        
        let horizontStackView = UIStackView()
        horizontStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 2, distribution: .fill)
        
        let textField1 = UITextField()
        textField1.borderStyle = .none
        textField1.placeholder = "Құпия сөз"
        textField1.textColor = .black
        horizontStackView.addArrangedSubview(textField1)
        
        let button = UIButton()
        button.setTitle("ЕСКЕ ТҮСІРУ", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.easy.layout(Height(50))
        horizontStackView.addArrangedSubview(UIView())
        horizontStackView.addArrangedSubview(button)
        
        textStackView.addArrangedSubview(horizontStackView)
        textStackView.cornerRadius(radius: 15, width: 0, color: .white)
        textStackView.setSpacing(top: 0, left: 30, right: 30, bottom: 0)
        self.stackView.addArrangedSubview(textStackView)
    }
}
extension SignInView : SignInProtocol{
    func goToResetPassword() {
        
    }
    
    func biometricAuth() {
        
    }
    
    func singIn() {
        
    }
    
    
}
