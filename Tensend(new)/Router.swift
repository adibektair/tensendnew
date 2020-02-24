//
//  Router.swift
//  Tensend
//
//  Created by root user on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
protocol RouterMain {
    var navigationController : UINavigationController? { get set }
    var assemblyBuilder : AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol : RouterMain {
    func initialViewController()
    func createPasswordViewController(phone: String,isRegister : Bool, code : String)
    func checkCodeViewController(isRegister : Bool, phone: String)
    func openCreatePasscodeController()
    func openSignInController()
    func popToRoot()
}
class Router: RouterProtocol {
    func createPasswordViewController(phone: String, isRegister: Bool, code : String) {
        if let navigationController = navigationController{
            guard let mainViewController = assemblyBuilder?.createCreatePasswordVC(phone: phone, router: self, isRegister: isRegister, code: code) else {
                return
            }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    func checkCodeViewController(isRegister: Bool, phone: String) {
        if let navigationController = navigationController{
                   guard let mainViewController = assemblyBuilder?.createCheckCodeVC(phone: phone, router: self, isRegister : isRegister) else {
                       return
                   }
               navigationController.pushViewController(mainViewController, animated: true)
               }
    }
    
    func openSignInController() {
        if let navigationController = navigationController{
            guard let mainViewController = assemblyBuilder?.createSignInController(router: self) else {
                return
            }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    
    func openCreatePasscodeController() {
        if let navigationController = navigationController{
            guard let mainViewController = assemblyBuilder?.createCreatePasscode() else {
                return
            }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    

    var navigationController: UINavigationController?
    
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navController : UINavigationController, assemblyProtocol: AssemblyBuilderProtocol) {
        self.assemblyBuilder = assemblyProtocol
        self.navigationController = navController
    }
    
    func initialViewController() {
        if let navigationController = navigationController{
            guard let mainViewController = assemblyBuilder?.createAuthModule(router: self) else {
                return
            }
            navigationController.viewControllers = [mainViewController]
        }
    }
 
    func popToRoot() {
        if let navigationController = navigationController{
            navigationController.popViewController(animated: true)
        }
    }

    
    
    
}
