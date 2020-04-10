//
//  SignInView.swift
//  Tensend(new)
//
//  Created by root user on 2/18/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import AKMaskField
import SDWebImage
import DropDown


let statusBarHeight = UIApplication.shared.statusBarFrame.height

class SignInView: ScrollStackController {
    
    let passwordTextField = UITextField()
    let textField = AKMaskField()
    var flagImageVew = UIImageView()
    var prefixLabel = UILabel()
    var presenter : SignInPresenterProtocol? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        self.navigationController?.navigationBar.isHidden = false
        self.stackView.easy.layout(Top(-statusBarHeight))
        self.makeNCTranslucent()
        self.createTopView()
        self.createMiddleView()
        self.createButtonsView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

    }
    
   
}



extension SignInView : SignInProtocol{
    func gotCountries() {
        if self.presenter?.countries!.count ?? 0 > 0 {
            self.flagImageVew.sd_setImage(with: URL(string: imageUrl + (self.presenter?.countries![0].imagePath!)!), completed: nil)
            self.prefixLabel.text = self.presenter?.countries![0].phonePrefix
        }
    }
    
    func error(message: String) {
        self.showAlert(title: "Внимание", message: message)
    }
    
    func success(){
        self.navigationController?.present(HomeVC(), animated: true, completion: nil)
    }
    
    @objc func goToResetPassword() {
        self.navigationController?.pushViewController(ResetPasswordVC(), animated: true)
    }
    
    @objc func biometricAuth() {
        if let _ = UserDefault.getValue(byKey: "token"){
            self.authenticationWithTouchID()
            self.success()
        }else{
            self.showAlert(title: "Внимание", message: "К сожалению, Вы прежде не входили в приложение, чтобы использовать биометрическую аутентификацию")
        }
    }
    
    @objc func singIn() {
        if let phone = self.textField.text, let password = self.passwordTextField.text{
            
            self.presenter?.signIn(phone: phone.filter("1234567890".contains), password: password)
        }else{
            self.showAlert(title: "Внимание", message: "Заполните все поля")
        }
        
    }

    
    func goToTabBar(){
        let tab = TabbarViewController()
        tab.modalPresentationStyle = .fullScreen
        self.present(tab, animated: true, completion: nil)
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
    
   
    func textFieldViewBySultan(){
            let textStackView = UIStackView()
            textStackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)

            let horizontStackView1 = UIStackView()
            horizontStackView1.setProperties(axis: .horizontal, alignment: .fill, spacing: 10, distribution: .fill)
        horizontStackView1.addArrangedSubview(flagImageVew)
        flagImageVew.easy.layout(Width(45))
        flagImageVew.contentMode = .scaleAspectFit
        flagImageVew.addTapGestureRecognizer {
            var arr = [String]()
            for country in self.presenter?.countries ?? []{
                arr.append(country.phonePrefix!)
            }
            let dropDown = DropDown()

            // The view to which the drop down will appear on
            dropDown.anchorView = self.flagImageVew  // UIView or UIBarButtonItem

            // The list of items to display. Can be changed dynamically
            dropDown.dataSource = arr

            dropDown.show()
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.flagImageVew.sd_setImage(with: URL(string: imageUrl + (self.presenter?.countries![index].imagePath!)!), completed: nil)
                self.prefixLabel.text = item
            }
        }
        
        
        horizontStackView1.addArrangedSubview(prefixLabel)
            let sepView = UIView()
        sepView.backgroundColor = .lightGray
        horizontStackView1.addArrangedSubview(sepView)
        sepView.easy.layout(Width(1))
        prefixLabel.easy.layout(Width(40))
        prefixLabel.font = prefixLabel.font.withSize(15)
            textField.borderStyle = .none
            textField.keyboardType = .phonePad
            textField.placeholder = "Телефон нөміріңіз"
            textField.textColor = .black
            textField.maskExpression = "({ddd}) {ddd} {dd} {dd}"
            horizontStackView1.addArrangedSubview(textField)
        textStackView.addArrangedSubview(horizontStackView1)

        
            let borderLine = UIView()
            borderLine.backgroundColor = .gray
            borderLine.easy.layout(Height(1))
            textStackView.addArrangedSubview(borderLine)
            
            let horizontStackView = UIStackView()
            horizontStackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 2, distribution: .fill)
            
            
            passwordTextField.borderStyle = .none
            passwordTextField.placeholder = "Құпия сөз"
            passwordTextField.textColor = .black
            passwordTextField.isSecureTextEntry = true
            horizontStackView.addArrangedSubview(passwordTextField)
            textField.easy.layout(Height(70))
            passwordTextField.easy.layout(Height(70))
            let button = UIButton()
            button.setTitle("ЕСКЕ ТҮСІРУ", for: .normal)
            button.setTitleColor(.darkGray, for: .normal)
    //        button.easy.layout(Height(50))
            button.addTarget(self, action: #selector(self.goToResetPassword), for: .touchUpInside)
            horizontStackView.addArrangedSubview(UIView())
            horizontStackView.addArrangedSubview(button)
            textStackView.addBackgroundColor(color: .white)
            textStackView.addArrangedSubview(horizontStackView)
            textStackView.setSpacing(top: 0, left: 15, right: 15, bottom: 0)
            
            let view = UIView()
            view.addSubview(textStackView)
            textStackView.easy.layout(Left(10), Right(10), Top(10), Bottom(10))
            view.backgroundColor = .white
            self.stackView.addArrangedSubview(view)
            view.cornerRadius(radius: 15, width: 0)
            view.easy.layout(Left(20), Right(20))
        }
   
    func createButtonsView(){
        let stackView = UIStackView()
        stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        let buttonView = UIView()
        let button = UIButton()
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(self.biometricAuth), for: .touchUpInside)
        button.setTitle("Touch/Face ID арқылы кіру", for: .normal)
        buttonView.addSubview(button)
        button.titleLabel?.textAlignment = .center
        button.easy.layout(Top(40), Bottom(), Left(50), Right(50), Height(25))
      //  stackView.addArrangedSubview(buttonView)
        
        
        let buttonView1 = UIView()
        let button1 = UIButton()
        button1.setTitleColor(.white, for: .normal)
        button1.setTitle("ЖАЛҒАСТЫРУ", for: .normal)
        button1.addTarget(self, action: #selector(self.singIn), for: .touchUpInside)
        button1.titleLabel?.font = button1.titleLabel?.font.withSize(18)
        button1.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        buttonView1.addSubview(button1)
        button1.titleLabel?.textAlignment = .center
        button1.easy.layout(Top(), Bottom(), Left(30), Right(30), Height(58))
        button1.cornerRadius(radius: 15, width: 0)
        stackView.addArrangedSubview(buttonView1)
        self.stackView.addArrangedSubview(stackView)
    }
    
    
    
}
/**

 */
