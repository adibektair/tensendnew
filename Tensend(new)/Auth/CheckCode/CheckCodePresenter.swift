//
//  CheckCodePresenter.swift
//  Tensend(new)
//
//  Created by root user on 2/4/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
protocol CheckCodeProtocol {
    func codeSent()
    func errorOccured()
    func correctCode()
    func incorrectCode()
}
protocol CheckCodePresenterProtocol {
    var phone: String { get set }
    func sendSmsCode(phone: String)
    func checkCode(phone: String, code: String)
    init(phone: String, view: CheckCodeProtocol, router: RouterProtocol)
}
class CheckCodePresenter: CheckCodePresenterProtocol {
    
    var phone: String
    var view : CheckCodeProtocol
    var router : RouterProtocol?
    
    func sendSmsCode(phone: String) {
        
    }
    
    func checkCode(phone: String, code: String) {
        
    }
    
    required init(phone: String, view: CheckCodeProtocol, router: RouterProtocol) {
        self.phone = phone
        self.view = view
        self.router = router
    }
    
    
}
