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
    func correctPassword()
}

protocol CreatePasswordPresenterProtocol {
    var phone : String { get set}
    func checkPasswords(password: String, password2: String)
    
    init(view: CreatePasswordProtocol, phone : String, networkLayer : NetworkLayer, router: RouterProtocol)
}

class CreatePasswordPresenter: CreatePasswordPresenterProtocol {
    
    
    var phone: String
    var view : CreatePasswordProtocol
    var networkManager : NetworkLayer
    var router : RouterProtocol
    
    required init(view: CreatePasswordProtocol, phone: String, networkLayer: NetworkLayer, router: RouterProtocol) {
        self.phone = phone
        self.view = view
        self.networkManager = networkLayer
        self.router = router
    }
    
    
    func checkPasswords(password: String, password2: String) {
        if password != password2{
            self.view.notCorrectPassword(message: "Пароли не совпадают")
            return
        }
        self.setPassword(password: password)
    }
    
    func setPassword(password : String){
        networkManager.register(phone: "7" + self.phone, password: password) { success in
            if success{
                self.view.correctPassword()
                self.router.openCreatePasscodeController()
            }else{
                self.view.notCorrectPassword(message: "Құпия сөзіңіз 8 ден 16 символ,\nжәне де үлкен, кіші әріптер мен\n@, !, # сиволдардан құралуы қажет")
            }
        }
    }
}
