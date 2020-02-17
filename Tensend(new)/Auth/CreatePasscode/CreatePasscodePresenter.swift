//
//  CreatePasscodePresenter.swift
//  Tensend(new)
//
//  Created by root user on 2/7/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import LocalAuthentication

protocol CreatePasscodeProtocol {
    func success()
    func repeatPasscode()
    func passcodesIncorrect()
}
protocol CreatePasscodePresenterProtocol {
    
    
    func acceptFirstPasscode(code: String)
    func acceptSecondPasscode(code: String)
    
    init(view: CreatePasscodeProtocol)
}

class CreatePasscodePresenter: CreatePasscodePresenterProtocol {
    
    var view: CreatePasscodeProtocol
    var firstPasscode : String?
    
    func acceptFirstPasscode(code: String) {
        self.firstPasscode = code
        self.view.repeatPasscode()
    }
    
    func acceptSecondPasscode(code: String) {
        if self.firstPasscode == code{
            
       
            self.view.success()
        }else{
            self.view.passcodesIncorrect()
        }
    }
    
    
    
    required init(view: CreatePasscodeProtocol) {
        self.view = view
    }
}
