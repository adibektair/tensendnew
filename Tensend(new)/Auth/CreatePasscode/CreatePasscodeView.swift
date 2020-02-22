//
//  CreatePasscodeView.swift
//  Tensend(new)
//
//  Created by root user on 2/7/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import EasyPeasy
import LocalAuthentication


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
        self.makeNCTranslucent()
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
        
        self.authenticationWithTouchID()
        
//        let vc = HomeVC()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: false, completion: nil)
    }
    
    func repeatPasscode() {
        
        // MARK: SULA, POSMOTRI
//        let successView = CorrectCodeView()
        
//        self.view.addSubview(successView)
        
//        successView.easy.layout(Top(20).to(self.infoLabel), CenterX(0))
        
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

extension UIViewController {
    
    func authenticationWithTouchID() {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Use Passcode"

        var authError: NSError?
        let reasonString = "To access the secure data"

        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
                
                if success {
                    
                    
                } else {
                    
                    guard let error = evaluateError else {
                        return
                    }
                    
                    print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error._code))
                    
                    //TODO: If you have choosen the 'Fallback authentication mechanism selected' (LAError.userFallback). Handle gracefully
                    
                }
            }
        } else {
            
            guard let error = authError else {
                return
            }
            //TODO: Show appropriate alert if biometry/TouchID/FaceID is lockout or not enrolled
            print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error.code))
        }
    }
    
    func evaluatePolicyFailErrorMessageForLA(errorCode: Int) -> String {
        var message = ""
        if #available(iOS 11.0, macOS 10.13, *) {
            switch errorCode {
                case LAError.biometryNotAvailable.rawValue:
                    message = "Authentication could not start because the device does not support biometric authentication."
                
                case LAError.biometryLockout.rawValue:
                    message = "Authentication could not continue because the user has been locked out of biometric authentication, due to failing authentication too many times."
                
                case LAError.biometryNotEnrolled.rawValue:
                    message = "Authentication could not start because the user has not enrolled in biometric authentication."
                
                default:
                    message = "Did not find error code on LAError object"
            }
        } else {
            switch errorCode {
                case LAError.touchIDLockout.rawValue:
                    message = "Too many failed attempts."
                
                case LAError.touchIDNotAvailable.rawValue:
                    message = "TouchID is not available on the device"
                
                case LAError.touchIDNotEnrolled.rawValue:
                    message = "TouchID is not enrolled on the device"
                
                default:
                    message = "Did not find error code on LAError object"
            }
        }
        
        return message;
    }
    
    func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String {
        
        var message = ""
        
        switch errorCode {
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.notInteractive.rawValue:
            message = "Not interactive"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"

        default:
            message = evaluatePolicyFailErrorMessageForLA(errorCode: errorCode)
        }
        
        return message
    }
}
