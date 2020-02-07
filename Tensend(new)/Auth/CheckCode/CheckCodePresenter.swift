//
//  CheckCodePresenter.swift
//  Tensend(new)
//
//  Created by root user on 2/4/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
protocol CheckCodeProtocol {
    func setView(phone:String)
    func codeSent()
    func errorOccured()
    func correctCode()
    func incorrectCode()
}
protocol CheckCodePresenterProtocol {
    var phone: String { get set }
    func sendSmsCode(phone: String)
    func checkCode(code: String)
    func setView()
    init(phone: String, view: CheckCodeProtocol, router: RouterProtocol, networkLayer: NetworkLayer)
}
class CheckCodePresenter: CheckCodePresenterProtocol {
    
    var phone: String
    var view : CheckCodeProtocol
    var router : RouterProtocol?
    var networkLayer : NetworkLayer
    
    func sendSmsCode(phone: String) {
        self.networkLayer.sendSMS(phone: "+7" + phone.filter("1234567890".contains), callback: { success in
            if !success{
                self.view.errorOccured()
             
            }
        })
    }
    
    func checkCode(code: String) {
        let phoneNumber = self.phone.filter("1234567890".contains)
        
        networkLayer.checkCode(phone: phoneNumber, code: code, callback: { success in
            if success{
                self.view.correctCode()
                   self.router?.createPasswordViewController(phone: phoneNumber)
            }else{
                self.view.incorrectCode()
                   self.router?.createPasswordViewController(phone: phoneNumber)
            }
        })
    }
    
    required init(phone: String, view: CheckCodeProtocol, router: RouterProtocol, networkLayer: NetworkLayer) {
        self.phone = phone
        self.view = view
        self.router = router
        self.networkLayer = networkLayer
        self.setView()
        self.sendSmsCode(phone: phone)
    }
    func setView() {
        self.view.setView(phone: self.phone)
    }
    
    
}
