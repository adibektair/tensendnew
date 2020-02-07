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
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
    }


    @IBAction func continueButtonPressed(_ sender: Any) {
        self.presenter!.checkPasswords(password: self.firstTextField.text ?? "", password2: self.secondTextField.text ?? "a")
    }
}
extension CreatePasswordView : CreatePasswordProtocol{
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
