//
//  Helpers.swift
//  Tensend(new)
//
//  Created by root user on 4/1/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    private static var sharedReference : Helper{
          let headers = Helper()
          return headers
    }
    
    class func shared() -> Helper {
          return sharedReference
    }
    
    func makeUserResponse( response : NSObject, callback: @escaping (String, String) -> ()){
        let res = response as! StandartResponse
        if res.success ?? false{
            callback("Керемет!", res.message ?? "try again later")
        }else{
            callback("Қате", res.message ?? "try again later")
        }
    }
    
}
extension UIViewController{
    func showReponseAlert(){
        
    }
}
