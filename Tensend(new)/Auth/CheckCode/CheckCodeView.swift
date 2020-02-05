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
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var sencondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fouthTextField: UITextField!
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func resendCodeButtonPressed(_ sender: Any) {
    }
    @IBAction func continueButtonPressed(_ sender: Any) {
    }
    

    
}

extension CheckCodeView: CheckCodeProtocol{
    func codeSent() {
        
    }
    
    func errorOccured() {
        
    }
    
    func correctCode() {
        
    }
    
    func incorrectCode() {
        
    }
    
    
}
