//
//  CreatePasswordPresenter.swift
//  Tensend(new)
//
//  Created by root user on 2/6/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit

protocol CreatePasswordProtocol {
    func notCorrectPassword(message: String)
    func success()
    func correctPassword()
}

protocol CreatePasswordPresenterProtocol {
    var phone : String { get set}
    func checkPasswords(password: String, password2: String)
    
    init(view: CreatePasswordProtocol, phone : String, networkLayer : NetworkLayer, router: RouterProtocol, isRegister : Bool, code : String)
}

class CreatePasswordPresenter: CreatePasswordPresenterProtocol {
    
    
    var phone: String
    var view : CreatePasswordProtocol
    var networkManager : NetworkLayer
    var router : RouterProtocol
    var isRegister : Bool?
    var code : String?
    
    required init(view: CreatePasswordProtocol, phone: String, networkLayer: NetworkLayer, router: RouterProtocol, isRegister : Bool, code : String) {
        self.phone = phone
        self.view = view
        self.networkManager = networkLayer
        self.router = router
        self.isRegister = isRegister
        self.code = code
    }
    
    
    func checkPasswords(password: String, password2: String) {
        if password != password2{
            self.view.notCorrectPassword(message: "Пароли не совпадают")
            return
        }
        self.setPassword(password: password)
    }
    
    func setPassword(password : String){
        if self.isRegister!{
            networkManager.register(phone: "7" + self.phone, password: password) { success in
                if success{
                    self.view.correctPassword()
                    self.router.openCreatePasscodeController()
                }else{
                    self.view.notCorrectPassword(message: "Құпия сөзіңіз 8 ден 16 символ,\nжәне де үлкен, кіші әріптер мен\n@, !, # сиволдардан құралуы қажет")
                }
            }
        }else{
            let params = [
                "code" : code!,
                "password" : password,
                "phone" : "7" + phone
            ] as [String : AnyObject]
            networkManager.resetPassword(parameters: params) { (success) in
                if success{
                    self.view.success()
                }else{
                    self.view.notCorrectPassword(message: "Перепроверьте валидность данных")
                }
            }
            
        }
        
    }
}
