//
//  NetworkLayout.swift
//  Tensend(new)
//
//  Created by root user on 1/31/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

let apiUrl = "https://tensend.me/api/v1/"

protocol NetworkLayoutProtocol {
    func getCountries(callback: @escaping (_ params: [Country]) -> ())
}
class NetworkLayer: NetworkLayoutProtocol {
    func getCountries(callback: @escaping ([Country]) -> ()) {
        Alamofire.request(apiUrl + "countries", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response: DataResponse<CountriesResponse>) in
            if let _ = response.response{
                let model  = response.result
                callback(model.value?.countries ?? [])
            }
        }
    }
}
