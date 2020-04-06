//
//  UserDefaults.swift
//  Tensend(new)
//
//  Created by root user on 2/17/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import UIKit

class UserDefault: UserDefaults {
    
    static func save(forKey : String, value : String){
        super.standard.set(value, forKey: forKey)
    }
    static func getValue(byKey: String) -> String?{
        return super.standard.string(forKey: byKey)
    }
    
    static func saveToken(token : String){
        self.save(forKey: "token", value: token)
    }
    
    static func getToken() -> String{
        guard let token = self.getValue(byKey: "token") else {
            return ""
        }
        
        return token
    }
    
    static func setFcmToken(fcmToken: String?){
        guard let token = fcmToken else{
            return
        }
        self.save(forKey: "fcmToken", value: token)
        self.sendFcmTokenToServer(token: token)
    }
    static func getFcmToken() -> String{
        return self.getValue(byKey: "fcmToken") ?? ""
    }
    static func sendFcmTokenToServer(token: String){
        let appToken = self.getToken()
        if appToken == ""{
            return
        }
        
        
    }
    
}
