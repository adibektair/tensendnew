//
//  MeditationRouter.swift
//  Tensend(new)
//
//  Created by root user on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import UIKit
protocol MeditationRouterPrividerProtocol {
    var navigationController : UINavigationController? { get set }
    var builder : MeditationBuilderProtocol? { get set }
}
protocol MeditationRouterProtocol : MeditationRouterPrividerProtocol{
    func initialController()
    func goToSingleMeditation(id: Int)
}
class MeditationRouter: MeditationRouterProtocol {
    func goToSingleMeditation(id: Int) {
        if let navigationController = navigationController{
        guard let mainViewController = builder?.createSingleMeditationPage(id: id, networkLayer: NetworkLayer()) else {
            return
        }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    
    func initialController() {
        if let navigationController = navigationController{
            guard let mainViewController = builder?.createMainMeditationPage(router: self) else {
                return
            }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    var navigationController: UINavigationController?
    
    var builder: MeditationBuilderProtocol?
    
    
}
