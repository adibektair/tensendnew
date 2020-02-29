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
            if let _ = response.response{
                let model  = response.result
                callback(model.value!)
            }
        }
    }
    public func getBanners(callback: @escaping (BannersResponse) -> ()){
        Alamofire.request(apiUrl + "banners", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response: DataResponse<BannersResponse>) in
            if let _ = response.response{
                let model  = response.result
                callback(model.value!)
            }
        }
    }
    public func getMeditations(page: Int, callback: @escaping (MeditationsResponse) -> ()){
        Alamofire.request(apiUrl + "meditations?page=\(page)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response: DataResponse<MeditationsResponse>) in
            if let _ = response.response{
                let model  = response.result
                model.value?.meditations?.currentPage = 2
                callback(model.value!)
            }
        }
    }
    public func getForMe(page: Int, callback: @escaping (ForMe) -> ()){
        let header = TokenHeaders.shared().getHeaders()
          Alamofire.request(apiUrl + "courses/for/me?page=\(page)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
              (response: DataResponse<ForMe>) in
              if let _ = response.response{
                  let model  = response.result
                model.value?.courses?.currentPage = 2
                  callback(model.value!)
              }
          }
      }
    public func coursesByCategory(id:String, callback: @escaping (ForMe) -> ()){
        let header = ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGVuc2VuZC5tZVwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE1ODIzOTU1NTEsIm5iZiI6MTU4MjM5NTU1MSwianRpIjoiNEtXRWlyWE1pUWlyZ29GMCIsInN1YiI6NTgsInBydiI6ImVlNWFjNjk0MjljNTU2ZDc1ZGJlN2ZmNGU1OGI5N2NkNGY3MTQyZWIifQ.aaLQcq5kSm0vfLfLn_DzVRLciWIhedUx5IIzl91Lx4Q"]
        Alamofire.request(apiUrl + "courses/category/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject{
               (response: DataResponse<ForMe>) in
            if let _ = response.response{
                let model  = response.result
                model.value?.courses?.currentPage = 2
                callback(model.value!)
            }
        }
    }

    
}
