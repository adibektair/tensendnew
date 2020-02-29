//
//  SingleMeditationPresenter.swift
//  Tensend(new)
//
//  Created by root user on 2/27/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
protocol SingleMeditationProtocol {
    func setUpViews()
}
protocol SingleMeditationPresenterProtocol {
    var view : SingleMeditationProtocol? { get set }
    var id : Int? { get set }
    var meditation : SingleMeditationResponse? { get set }
    init(networkLayer : NetworkLayer, id : Int, view : SingleMeditationProtocol)
    
}

class SingleMeditationPresenter: SingleMeditationPresenterProtocol {
    var view: SingleMeditationProtocol?
    var networkLayer : NetworkLayer?
    var id: Int?
    var meditation : SingleMeditationResponse?
    
    required init(networkLayer: NetworkLayer, id: Int, view: SingleMeditationProtocol) {
        self.id = id
        self.view = view
        self.networkLayer = networkLayer
        self.getMeditation()
    }
    func getMeditation(){
        guard let id = self.id else {
            return
        }
        self.networkLayer?.getSingleMeditation(id: id, callback: { (result) in
            self.meditation = result
            self.view?.setUpViews()
        })
    }
    
}
