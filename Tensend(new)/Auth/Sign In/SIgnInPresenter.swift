//
//  SIgnInPresenter.swift
//  Tensend(new)
//
//  Created by root user on 2/18/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation

protocol SignInProtocol {
    func goToResetPassword()
    func biometricAuth()
    func error(message : String)
    func singIn()
    func success()
    func goToTabBar()
}

protocol SignInPresenterProtocol {
    init(router : Router, networkLayer : NetworkLayer, view : SignInProtocol)
    func signIn(phone: String, password: String)
    func goToResetPassword()
}

class SignInPresenter: SignInPresenterProtocol {
    let view : SignInProtocol?
    let router : Router?
    let networkLayer : NetworkLayer?
    
    required init(router: Router, networkLayer: NetworkLayer, view: SignInProtocol) {
        self.router = router
        self.view = view
        self.networkLayer = networkLayer
    }
    
    func signIn(phone: String, password: String) {
        self.networkLayer?.signIn(parameters: ["phone" : phone, "password" : password,
                                               "device_token" : UserDefault.getFcmToken(),
                                               "platform" : "IOS"] as [String : AnyObject], callback: { (success) in
            if !success{
                self.view?.error(message: "Перепроверьте валидность данных")
                return
            }else{
                self.view?.goToTabBar()
            }
        })
    }
    
    func goToResetPassword() {
        
    }
    
    
}
