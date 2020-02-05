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
}
class AssemblyModuleBuilder: AssemblyBuilderProtocol {
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
