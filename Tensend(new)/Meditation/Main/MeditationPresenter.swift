//
//  MainPresenter.swift
//  Tensend(new)
//
//  Created by root user on 2/24/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
protocol MeditationProtocol {
    func gotMeditations()

}

protocol MeditationPresenterProtocol {
    var view : MeditationProtocol { get set }
    var meditations : [DataObject]? { get set }
    func goToSingle(id: Int)
    init(networkLayer : NetworkLayer, view: MeditationProtocol, router : MeditationRouterProtocol)
}
class MeditationPresenter: MeditationPresenterProtocol{
    var meditations: [DataObject]?
    
    var view: MeditationProtocol
    var networkLayer : NetworkLayer
    var router : MeditationRouterProtocol
    
    
    required init(networkLayer: NetworkLayer, view: MeditationProtocol, router: MeditationRouterProtocol) {
        self.view = view
        self.router = router
        self.networkLayer = networkLayer
        self.getMeditations()
    }
    
    func getMeditations(){
        networkLayer.getMeditations { (data) in
            self.meditations = data
            self.view.gotMeditations()
        }
    }
    
    func goToSingle(id: Int){
        self.router.goToSingleMeditation(id: id)
    }
}
