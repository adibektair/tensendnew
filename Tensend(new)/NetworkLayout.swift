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
    
    func sendSMS(phone: String, callback: @escaping (_ success: Bool) -> ())
    
    func checkCode(phone: String, code: String, callback: @escaping (_ success: Bool) -> ())
}
class NetworkLayer: NetworkLayoutProtocol {
    
    func register(phone: String, password: String, callback: @escaping (Bool) -> ()) {
           let json = ["phone" : phone, "password" : password] as [String: AnyObject]
           
            Alamofire.request(apiUrl + "register", method: .post, parameters: json, encoding: JSONEncoding.default, headers: nil).responseObject{
                       (response: DataResponse<RegisterResponse>) in
                       if let _ = response.response{
                           let model  = response.result
                        
                           callback(model.value?.success ?? false)
                       }
                   }
       }
    
    func checkCode(phone: String, code: String, callback: @escaping (Bool) -> ()) {
        let json = ["phone" : phone, "code" : code] as [String: AnyObject]
        
         Alamofire.request(apiUrl + "code/check", method: .post, parameters: json, encoding: JSONEncoding.default, headers: nil).responseObject{
                    (response: DataResponse<StandartResponse>) in
                    if let _ = response.response{
                        let model  = response.result
                        callback(model.value?.success ?? false)
                    }
                }
    }
    
    
    
    func sendSMS(phone: String, callback: @escaping (Bool) -> ()) {
        let json = ["phone" : phone] as [String: AnyObject]
        Alamofire.request(apiUrl + "code/send", method: .post, parameters: json, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response: DataResponse<StandartResponse>) in
            if let _ = response.response{
                let model  = response.result
                callback(model.value?.success ?? false)

            }
        }
    }
    
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
