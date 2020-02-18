//
//  Builder.swift
//  Tensend
//
//  Created by root user on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
protocol AssemblyBuilderProtocol {
    func createAuthModule(router: Router) -> UIViewController
    func createCheckCodeVC(phone: String, router: Router) -> UIViewController
    func createCreatePasswordVC(phone: String, router: Router) -> UIViewController
    func createCreatePasscode() -> UIViewController
    
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func createCreatePasscode() -> UIViewController {
        let view = CreatePasscodeView()
        let presenter = CreatePasscodePresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func createCreatePasswordVC(phone: String, router: Router) -> UIViewController {
        let networkLayer = NetworkLayer()
        let view = CreatePasswordView()
        let presenter = CreatePasswordPresenter(view: view, phone: phone, networkLayer: networkLayer, router: router)
        view.presenter = presenter
        return view
    }
    
    func createCheckCodeVC(phone: String, router: Router) -> UIViewController {
        let view = CheckCodeView()
        let presenter = CheckCodePresenter(phone: phone, view: view, router: router, networkLayer: NetworkLayer())
        view.presenter = presenter
        return view
    }
    
    
    public func createAuthModule(router: Router) -> UIViewController {
        let view = MainVC()
        let presenter = MainPresenter(view: view, networkLayer: NetworkLayer(), router: router)
        view.presenter = presenter
        return view
    }
    
    
}
