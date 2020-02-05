//
//  CheckCodeView.swift
//  Tensend(new)
//
//  Created by root user on 2/4/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

class CheckCodeView: UIViewController {

    
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
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fouthTextField: UITextField!
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phoneNumberLabel.text = "\(presenter.phone) нөміріне\n 4 саны бар SMS-хабарлама жіберілді.\n SMS-тегі кодты еңгізіңіз."
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
        
    }
    
    func correctCode() {
        
    }
    
    func incorrectCode() {
        
    }
    
    
}
