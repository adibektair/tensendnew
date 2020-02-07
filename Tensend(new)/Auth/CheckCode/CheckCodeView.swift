//
//  CheckCodeView.swift
//  Tensend(new)
//
//  Created by root user on 2/4/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CheckCodeView: UIViewController, UITextFieldDelegate {

    
    var presenter: CheckCodePresenter!
    
    // MARK: Outlets
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var firstView: UIView!{
        didSet{
            self.firstView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
    @IBOutlet weak var sencondView: UIView!{
        didSet{
            self.sencondView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
    @IBOutlet weak var thirdView: UIView!{
        didSet{
            self.thirdView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
    @IBOutlet weak var fourthView: UIView!{
        didSet{
            self.fourthView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
    @IBOutlet weak var continueButton: UIButton!{
        didSet{
            self.continueButton.cornerRadius(radius: 16, width: 0, color: .white)
        }
    }
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fouthTextField: UITextField!
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
        self.phoneNumberLabel.text = "\(presenter.phone) нөміріне\n 4 саны бар SMS-хабарлама жіберілді.\n SMS-тегі кодты еңгізіңіз."
        self.firstTextField.becomeFirstResponder()
               self.firstTextField.delegate = self
               self.secondTextField.delegate = self
               self.thirdTextField.delegate = self
               self.fouthTextField.delegate = self
               firstTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
               secondTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
               thirdTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
               fouthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    // MARK: Actions
    @IBAction func resendCodeButtonPressed(_ sender: Any) {
    }
    @IBAction func continueButtonPressed(_ sender: Any) {
    }
    

    
}

extension CheckCodeView: CheckCodeProtocol{
    func setView(phone: String) {
//        self.phoneNumberLabel.text = "\(phone) нөміріне\n 4 саны бар SMS-хабарлама жіберілді.\n SMS-тегі кодты еңгізіңіз."
    }
    
    func codeSent() {
        
    }
    
    func errorOccured() {
        self.showAlert(title: "Внимание", message: "Проверьте соединение с интернетом")
    }
    
    func correctCode() {
        self.firstView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0, green: 0.8352941176, blue: 0, alpha: 1))
        self.sencondView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0, green: 0.8352941176, blue: 0, alpha: 1))
        self.thirdView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0, green: 0.8352941176, blue: 0, alpha: 1))
        self.fourthView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0, green: 0.8352941176, blue: 0, alpha: 1))
    }
    
    func incorrectCode() {
        self.firstView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.sencondView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.thirdView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.fourthView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.phoneNumberLabel.textColor = #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1)
        self.phoneNumberLabel.text = "Еңгізілген код қате\nҚайта теріп көріңіз"
    }
    
    
}

extension CheckCodeView{
    
    func clear(){
          firstTextField.becomeFirstResponder()
          firstTextField.text = ""
          secondTextField.text = ""
          thirdTextField.text = ""
          fouthTextField.text = ""
      }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           guard let text = textField.text else { return true }
           let newLength = text.count + string.count - range.length
           if textField != firstTextField{
               let  char = string.cString(using: String.Encoding.utf8)!
               let isBackSpace = strcmp(char, "\\b")
               print("IS BACK", isBackSpace)
               if (isBackSpace == -92) {
                    self.clear()
               }
           }
           return newLength <= 1 // Bool
       }
       
       @objc func textFieldDidChange(textField: UITextField) {
           if textField == firstTextField{
               if textField.text!.count > 0{
                   self.secondTextField.becomeFirstResponder()
               }
           }
           else if textField == secondTextField{
               if textField.text!.count > 0{
                   self.thirdTextField.becomeFirstResponder()
               }
           }
           else if textField == thirdTextField{
               if textField.text!.count > 0{
                   self.fouthTextField.becomeFirstResponder()
               }
           }else if textField == fouthTextField{
               if textField.text!.count > 0{
                   // log in
                   if !(firstTextField.text?.isEmpty)! && !(secondTextField.text?.isEmpty)! && !(thirdTextField.text?.isEmpty)!{
                       if let code = Int(firstTextField.text! + secondTextField.text! + thirdTextField.text! + fouthTextField.text!){
                        

                        self.presenter.checkCode(code: String(code))
                          
                           
                       }
                       else{
                           
                           self.showAlert(title: "Внимание", message: "Некорректный код")
                       }
                       
                   }else{
                       
                       self.showAlert(title: "Внимание", message: "Некорректный код")
                   }
                   
                   
               }
           }
       }
       
}
