//
//  MainPresenter.swift
//  Tensend
//
//  Created by root user on 1/28/20.
//  Copyright © 2020 Sultan. All rights reserved.
//

import UIKit
protocol MainViewProtocol {
    func keyboardAppeared()
    func success()
    func changeCountry()
}
protocol MainViewPresenterProtocol {
    var countries : [Country]? { get set }
    init(view: MainViewProtocol, networkLayer: NetworkLayoutProtocol, router: RouterProtocol)
    func keyboardAppeared()
    func changeCountry()
    func login(phone: String)
    func skip()
    func getCountries()
}
class MainPresenter: MainViewPresenterProtocol {
   
    
    var countries: [Country]?
    
    var view : MainViewProtocol?
    let network : NetworkLayoutProtocol
    var router : RouterProtocol?
    
    required init(view: MainViewProtocol, networkLayer: NetworkLayoutProtocol, router: RouterProtocol) {
        self.network = networkLayer
        self.view = view
        self.router = router
        self.getCountries()
    }
    
    func keyboardAppeared() {
        
    }
    
    func changeCountry() {
    }
    
    func login(phone: String) {
        router?.checkCodeViewController(phone: phone)
    }
    func goToSignInt(){
        router?.openSignInController()
    }
    func skip() {
        
    }
    
    func getCountries() {
        self.network.getCountries(callback: { [weak self] countries in
            guard let self = self else { return }
            self.countries = countries
            self.view?.success()
        })
    }
    
}
