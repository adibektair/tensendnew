//
//  MeditaionBuilder.swift
//  Tensend(new)
//
//  Created by root user on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import UIKit
protocol MeditationBuilderProtocol{
    func createMainMeditationPage(router : MeditationRouterProtocol) -> UIViewController
    func createSingleMeditationPage(id: Int, networkLayer : NetworkLayer) -> UIViewController
}
class MeditationBuilder : MeditationBuilderProtocol {
    func createSingleMeditationPage(id: Int, networkLayer: NetworkLayer) -> UIViewController{
        let view = SingleMeditationView()
        let presenter = SingleMeditationPresenter(networkLayer: networkLayer, id: id, view: view)
        view.presenter = presenter
        return view
    }
    
    func createMainMeditationPage(router : MeditationRouterProtocol) -> UIViewController {
        let networkLayer = NetworkLayer()
        let view = MeditationsView()
        let presenter = MeditationPresenter(networkLayer: networkLayer, view: view, router : router)
        view.presenter = presenter
        return view
    }
    
    
}
