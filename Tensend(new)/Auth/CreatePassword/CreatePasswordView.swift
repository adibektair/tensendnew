//
//  CreatePasswordView.swift
//  Tensend(new)
//
//  Created by root user on 2/6/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CreatePasswordView: UIViewController {

    var presenter : CreatePasswordPresenterProtocol? = nil
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var textFieldsView: UIView!{
        didSet{
            self.textFieldsView.cornerRadius(radius: 15, width: 0, color: .white)
        }
    }
    @IBOutlet weak var constraint: NSLayoutConstraint!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!{
        didSet{
            self.continueButton.cornerRadius(radius: 15, width: 0, color: .clear)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }


    @IBAction func continueButtonPressed(_ sender: Any) {
        self.presenter!.checkPasswords(password: self.firstTextField.text ?? "", password2: self.secondTextField.text ?? "a")
    }
    @objc func keyboardWillAppear() {
        UIView.animate(withDuration: 1) {
            self.constraint.constant = 10
        }
    }

    @objc func keyboardWillDisappear() {
        UIView.animate(withDuration: 1) {
            self.constraint.constant = 35
        }
    }
}
extension CreatePasswordView : CreatePasswordProtocol{
    func success() {
        let alertController = UIAlertController(title: "Внимание", message: "Вы успешно изменили пароль, теперь можете войти", preferredStyle: .alert)

        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            for controller in self.navigationController!.viewControllers{
                       if controller.isKind(of: SignInView.self){
                           self.navigationController?.popToViewController(controller, animated: true)
                       }
                   }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }

        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
       
    }
    
    func notCorrectPassword(message: String) {
        self.infoLabel.text = message
        self.infoLabel.textColor = #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1)
        self.textFieldsView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1))
        self.separatorView.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0, blue: 0, alpha: 1)
    }
    
    func correctPassword() {
        self.infoLabel.text = ""
        self.infoLabel.textColor = #colorLiteral(red: 0, green: 0.8274509804, blue: 0, alpha: 1)
        self.textFieldsView.cornerRadius(radius: 15, width: 1, color: #colorLiteral(red: 0, green: 0.8274509804, blue: 0, alpha: 1))
        self.separatorView.backgroundColor = #colorLiteral(red: 0, green: 0.8274509804, blue: 0, alpha: 1)
     
    }
    
    
}
