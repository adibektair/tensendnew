//
//  HomeRequests.swift
//  Tensend(new)
//
//  Created by Sultan on 2/14/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import Alamofire

class HomeRequests {
    
    static let sharedInstance : HomeRequests = {
        return HomeRequests()
    }()
    
    public func getCategories(page: Int, callback: @escaping (CategoriesResponse) -> ()){
        Alamofire.request(apiUrl + "courses/categories?page=\(page)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response: DataResponse<CategoriesResponse>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    public func getBanners(callback: @escaping (BannersResponse) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "banners", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<BannersResponse>) in
            
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    public func getMeditations(page: Int, callback: @escaping (MeditationsResponse) -> ()){
        Alamofire.request(apiUrl + "meditations?page=\(page)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response: DataResponse<MeditationsResponse>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                model.value?.meditations?.currentPage = 2
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    public func getForMe(page: Int, callback: @escaping (ForMe) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "courses/for/me?page=\(page)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<ForMe>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                model.value?.courses?.currentPage = 2
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    public func coursesByCategory(id:String, callback: @escaping (ForMe) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "courses/category/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<ForMe>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                model.value?.courses?.currentPage = 2
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    
    public func getCourse(id:String, callback: @escaping (ForMe) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "courses/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<ForMe>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                model.value?.courses?.currentPage = 2
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    public func startLesson(id:String, callback: @escaping (SuccessMessageObject) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "courses/start/\(id)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<SuccessMessageObject>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    
    public func getMyCourses( callback: @escaping (ForMe) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "users/courses", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<ForMe>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                model.value?.courses?.currentPage = 2
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    public func getMaterial(id:String, callback: @escaping (MaterialResponse) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "courses/material/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<MaterialResponse>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                if model.value != nil {
                    callback(model.value!)
                }
            }
        }
    }
    public func getSubscriptions(callback: @escaping (SubscriptionTypeResponse) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "subscription/types", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<SubscriptionTypeResponse>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                callback(model.value!)
            }
        }
    }
    public func passLesson(param: [String: Any],callback: @escaping (StandartResponse) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "courses/material/pass", method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<StandartResponse>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                if let value = model.value {
                    callback(value)
                }
            }
        }
    }
    public func rateCourse(param: [String: Any],callback: @escaping (StandartResponse) -> ()){
        let header = TokenHeaders.shared().getHeaders()
        Alamofire.request(apiUrl + "evaluate/course", method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseObject{
            (response: DataResponse<StandartResponse>) in
            if let statusCode = response.response?.statusCode, statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unauthorized"), object: nil)
                return
            }
            if let _ = response.response{
                let model  = response.result
                if let value = model.value {
                    callback(value)
                }
            }
        }
    }
    
    
}
