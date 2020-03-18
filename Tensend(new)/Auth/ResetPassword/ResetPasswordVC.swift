//
//  ResetPasswordVC.swift
//  Tensend(new)
//
//  Created by root user on 2/22/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import AKMaskField
import DropDown

class ResetPasswordVC: ScrollStackController {
    var countries = [Country]()
    let topView = UIView()
    let continueButton = UIButton()
    let phoneTextField = AKMaskField()
    let changeCountryButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stackView.easy.layout(Top(-statusBarHeight))
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        self.makeNCTranslucent()
        self.createTopView()
        self.createMiddleView()
        self.createTextFieldView()
        self.createButton()
        
        NetworkLayer().getCountries(callback: { [weak self] countries in
            guard let self = self else { return }
            self.countries = countries
        })
    }
    


}
extension ResetPasswordVC{
     func createTopView(){
          let image = UIImageView()
          image.image = #imageLiteral(resourceName: "Монтажная область -1")
          topView.addSubview(image)
          image.easy.layout(Top(), Bottom(), Left(), Right())
          let logoImageView = UIImageView()
          logoImageView.image = #imageLiteral(resourceName: "Path 10")
          topView.addSubview(logoImageView)
          logoImageView.easy.layout(Center(), Height(81), Width(105))
          let label = UILabel()
          label.text = "Tensend"
          label.textColor = .white
          topView.addSubview(label)
          label.easy.layout(Top(10).to(logoImageView), CenterX().to(logoImageView))
          stackView.addArrangedSubview(topView)
          topView.easy.layout(Top(), Left(), Right(), Height(UIScreen.main.bounds.height * 0.33))
      }
    
    func createMiddleView(){
            let view = UIView()
            let label = UILabel()
            label.text = "Құпия сөзді еске салу"
            label.font = label.font.withSize(20)
            label.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            label.textAlignment = .center
            view.addSubview(label)
            label.easy.layout(Top(50), CenterX(), Height(20),Top(),Bottom())
            stackView.addArrangedSubview(view)
            
            let view2 = UIView()
            let label1 = UILabel()
            label1.text = "Tensend-ке тіркелгенде\nкөрсеткен телефон нөміріңізді\nеңгізіңіз"
            label1.font = UIFont(name: "Montserrat-Regular", size: 16)
            label1.textColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
            label1.numberOfLines = 0
            label1.textAlignment = .center
            view2.addSubview(label1)
            label1.easy.layout(Top(20), CenterX(), Left(30), Right(30),Bottom())
            stackView.addArrangedSubview(view2)
    //        self.createTextFieldsView()
        }
    
    func createTextFieldView(){
        let view = UIView()
        view.backgroundColor = .white
        
        
        let stackView = UIStackView()
        stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 2, distribution: .fill)
        
        
        
        changeCountryButton.setTitle("+7", for: .normal)
        changeCountryButton.setTitleColor(.gray, for: .normal)
        stackView.addArrangedSubview(changeCountryButton)
        
        let separator = UIView()
        separator.backgroundColor = .gray
        stackView.addArrangedSubview(separator)
        
        
        phoneTextField.borderStyle = .none
        phoneTextField.keyboardType = .numberPad
        phoneTextField.placeholder = "Телефон нөміріңіз"
        phoneTextField.textColor = .black
        phoneTextField.maskExpression = "({ddd}) {ddd} {dd} {dd}"

        
        stackView.addArrangedSubview(phoneTextField)
        changeCountryButton.easy.layout(Top(0), Width(50), Left(10), Height(30))
        separator.easy.layout(Top(10), Bottom(10), Height(30), Width(1), Left(10).to(changeCountryButton))
        phoneTextField.easy.layout(Top(10), Bottom(10), Left(10).to(separator), Right(10), Height(30))
        view.addSubview(stackView)
        stackView.easy.layout(Top(10), Bottom(10), Left(10), Right(10))
        self.stackView.addArrangedSubview(view)
        view.easy.layout(Height(70), Left(20), Right(20))
        view.cornerRadius(radius: 15, width: 0)
        
    }
    
    
    func createButton(){
        
        
        continueButton.backgroundColor = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.7882352941, alpha: 1)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.setTitle("Жалғастыру", for: .normal)
        continueButton.cornerRadius(radius: 15, width: 0)
        continueButton.titleLabel?.font = continueButton.titleLabel?.font.withSize(20)
        continueButton.addTarget(self, action: #selector(self.goToCheckCode), for: .touchUpInside)
        self.stackView.addArrangedSubview(continueButton)
        self.continueButton.easy.layout(Left(30), Right(30), Height(58))
        self.continueButton.isHidden = true
    }
    @objc func keyboardWillAppear() {
//           UIView.animate(withDuration: 1) {
            self.stackView.easy.layout(Top(15))
            self.topView.isHidden = true
            self.continueButton.isHidden = false
            
//        }
       }

       @objc func keyboardWillDisappear() {
//           UIView.animate(withDuration: 1) {
            self.stackView.easy.layout(Top(-statusBarHeight))
                self.topView.isHidden = false
               self.continueButton.isHidden = true
//           }
       }
    
    @objc func goToCheckCode(){
    
        if self.phoneTextField.text != ""{
            let router = Router(navController: self.navigationController!, assemblyProtocol: AssemblyModuleBuilder())
            router.checkCodeViewController(isRegister: false, phone: self.phoneTextField.text!)
        }
        
        
        
    }
    
    
    @objc func changeCountry(){
            var arr = [String]()
            for country in self.countries {
                   arr.append(country.phonePrefix!)
            }
            let dropDown = DropDown()

               // The view to which the drop down will appear on
               dropDown.anchorView = self.changeCountryButton  // UIView or UIBarButtonItem

               // The list of items to display. Can be changed dynamically
               dropDown.dataSource = arr

               dropDown.show()
               dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                    self.changeCountryButton.setTitle(item, for: .normal)
               }
    }
}
