//
//  CreatePasscodeView.swift
//  Tensend(new)
//
//  Created by root user on 2/7/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CreatePasscodeView: UIViewController, UITextFieldDelegate {

    var presenter : CreatePasscodePresenterProtocol?
    var isFirst = true
    
    @IBOutlet weak var profileView: UIView!{
        didSet{
            self.profileView.cornerRadius(radius: 35, width: 5, color: .white)
        }
    }
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var firstView: UIView!{
        didSet{
            self.firstView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
    
    @IBOutlet weak var secondView: UIView!{
        didSet{
            self.secondView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
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
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstTextField.becomeFirstResponder()
        self.firstTextField.delegate = self
        self.secondTextField.delegate = self
        self.thirdTextField.delegate = self
        self.fourthTextField.delegate = self
        firstTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
            secondTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
            thirdTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
            fourthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }



}
extension CreatePasscodeView : CreatePasscodeProtocol{
    func success() {
        self.firstView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        self.secondView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        self.thirdView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        self.fourthView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        let vc = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    func repeatPasscode() {
        self.infoLabel.text = "Еңгізген құпия саныңызды\nқайта теріңіз"
        self.clear()
        self.firstView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1))
        self.secondView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1))
        self.thirdView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1))
        self.fourthView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1))
        self.isFirst = false
    }
    
    func passcodesIncorrect() {
        self.infoLabel.text = "Еңгізген құпия саныңыз дұрыс емес"
        self.firstView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.secondView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.thirdView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.fourthView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.clear()
        self.isFirst = true
        self.firstTextField.becomeFirstResponder()
    }
    
    
}

extension CreatePasscodeView{
    
    func clear(){
          firstTextField.becomeFirstResponder()
          firstTextField.text = ""
          secondTextField.text = ""
          thirdTextField.text = ""
          fourthTextField.text = ""
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
                   self.fourthTextField.becomeFirstResponder()
               }
           }else if textField == fourthTextField{
               if textField.text!.count > 0{
                   // log in
                   if !(firstTextField.text?.isEmpty)! && !(secondTextField.text?.isEmpty)! && !(thirdTextField.text?.isEmpty)!{
                       if let code = Int(firstTextField.text! + secondTextField.text! + thirdTextField.text! + fourthTextField.text!){
                        

                        if self.isFirst{
                            presenter!.acceptFirstPasscode(code: "\(code)")
                        }else{
                            presenter!.acceptSecondPasscode(code: "\(code)")
                        }
                           
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
