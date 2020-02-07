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
    func createPasswordViewController(phone: String)
    func checkCodeViewController(phone: String)
    func openCreatePasscodeController()
    func popToRoot()
}
class Router: RouterProtocol {
    
    func openCreatePasscodeController() {
        if let navigationController = navigationController{
            guard let mainViewController = assemblyBuilder?.createCreatePasscode() else {
                return
            }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    
    
    func createPasswordViewController(phone: String) {
       if let navigationController = navigationController{
           guard let mainViewController = assemblyBuilder?.createCreatePasswordVC(phone: phone, router: self) else {
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
    func checkCodeViewController(phone: String){
        if let navigationController = navigationController{
            guard let mainViewController = assemblyBuilder?.createCheckCodeVC(phone: phone, router: self) else {
                return
            }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController{
            navigationController.popViewController(animated: true)
        }
    }

    
    
    
}
