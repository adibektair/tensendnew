//
//  NetworkLayout.swift
//  Tensend(new)
//
//  Created by root user on 1/31/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireObjectMapper

let apiUrl = "https://tensend.me/api/v1/"
let apiImgUrl = "https://tensend.me/"

protocol NetworkLayoutProtocol {
    
    func getCountries(callback: @escaping (_ params: [Country]) -> ())
    
    func sendSMS(phone: String, callback: @escaping (_ success: Bool) -> ())
    
    func checkCode(phone: String, code: String, callback: @escaping (_ success: Bool) -> ())
    
    func register(phone: String, password: String, callback: @escaping (Bool) -> ())
    
    func signIn(parameters: [String : AnyObject], callback: @escaping (Bool) -> ())
    
    func resetPassword(parameters: [String : AnyObject], callback: @escaping (Bool) -> ())
    
    func getMeditations(callback: @escaping ([Data]) -> ())
    func getSingleMeditation(id: Int, callback: @escaping (SingleMeditationResponse?) -> ())
    
}
class NetworkLayer: NetworkLayoutProtocol {
    
    
    func resetPassword(parameters: [String : AnyObject], callback: @escaping (Bool) -> ()) {
        Alamofire.request(apiUrl + "code/reset", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseObject{
                          (response: DataResponse<RegisterResponse>) in
                          if let _ = response.response{
                               let model  = response.result
                               if let token = model.value?.token{
                                   UserDefault.saveToken(token: token)
                               }
                               callback(model.value?.success ?? false)
            }
        }
    }
    
   
    
    
    func signIn(parameters: [String : AnyObject], callback: @escaping (Bool) -> ()) {
        Alamofire.request(apiUrl + "login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseObject{
                   (response: DataResponse<RegisterResponse>) in
                   if let _ = response.response{
                        let model  = response.result
                        if let token = model.value?.token{
                            UserDefault.saveToken(token: token)
                        }
                        callback(model.value?.success ?? false)
                   }
               }
    }
    
    
    func register(phone: String, password: String, callback: @escaping (Bool) -> ()) {
           let json = ["phone" : phone, "password" : password] as [String: AnyObject]
           
            Alamofire.request(apiUrl + "register", method: .post, parameters: json, encoding: JSONEncoding.default, headers: nil).responseObject{
                       (response: DataResponse<RegisterResponse>) in
                       if let _ = response.response{
                            let model  = response.result
                            if let token = model.value?.token{
                                UserDefault.saveToken(token: token)
                            }
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
    
    func getMeditations(callback: @escaping ([Data]) -> ()) {
        Alamofire.request(apiUrl + "meditations", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response: DataResponse<MeditationsResponse>) in
            if let _ = response.response{
                let model  = response.result
                callback(model.value?.meditations?.data ?? [])
            }
        }
    }
    
     func getSingleMeditation(id: Int, callback: @escaping (SingleMeditationResponse?) -> ()) {
        
        Alamofire.request(apiUrl + "meditation/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: TokenHeaders.shared().getHeaders()).responseObject{
            (response: DataResponse<SingleMeditationResponse>) in
            if let _ = response.response{
                let model  = response.result
                callback(model.value ?? nil)
            }
        }
    }
    
    func getLink(callback: @escaping (LinkResponse?) -> ()) {
        Alamofire.request(apiUrl + "profile/promo-code", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: TokenHeaders.shared().getHeaders()).responseObject{
            (response: DataResponse<LinkResponse>) in
            if let _ = response.response{
                let model = response.result
                callback(model.value ?? nil)
            }
        }
    }
    
    
    func getProfile(callback: @escaping (ProfileResponse?) -> ()) {
           Alamofire.request(apiUrl + "profile", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: TokenHeaders.shared().getHeaders()).responseObject{
               (response: DataResponse<ProfileResponse>) in
               if let _ = response.response{
                   let model = response.result
                   callback(model.value ?? nil)
               }
           }
    }
    func setProfile(params : [String: AnyObject], callback: @escaping (StandartResponse?) -> ()) {
             Alamofire.request(apiUrl + "profile/update", method: .post, parameters: params, encoding: JSONEncoding.default, headers: TokenHeaders.shared().getHeaders()).responseObject{
                 (response: DataResponse<StandartResponse>) in
                 if let _ = response.response{
                     let model = response.result
                     callback(model.value ?? nil)
                 }
             }
      }
    
    
    func getRatings(callback: @escaping (RatingResponse?) -> ()) {
             Alamofire.request(apiUrl + "evaluate/rating", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: TokenHeaders.shared().getHeaders()).responseObject{
                 (response: DataResponse<RatingResponse>) in
                 
                if let _ = response.response{
                     let model = response.result
                     callback(model.value ?? nil)
                 }
             }
      }
    
    func getMaterials(callback: @escaping (MarketingResponse?) -> ()) {
             Alamofire.request(apiUrl + "profile/marketing-materials", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: TokenHeaders.shared().getHeaders()).responseObject{
                 (response: DataResponse<MarketingResponse>) in
                if let _ = response.response{
                     let model = response.result
                     callback(model.value ?? nil)
                 }
             }
      }

}
