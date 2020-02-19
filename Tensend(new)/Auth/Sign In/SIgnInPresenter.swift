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
    func singIn()
}

protocol SignInPresenter {
    init(router : Router, networkLayer : NetworkLayer, view : SignInProtocol)
    func signIn()
    func goToResetPassword()
}

