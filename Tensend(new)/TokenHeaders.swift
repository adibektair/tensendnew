//
//  File.swift
//  Tensend(new)
//
//  Created by root user on 2/28/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import UIKit
public class TokenHeaders{
    
    let token = UserDefault.getToken()
    private static var sharedReference : TokenHeaders{
        let headers = TokenHeaders()
        return headers
    }
    
    func getHeaders() -> [String: String]{
        let headers = [
            "Authorization" : "Bearer \(self.token)"
        ]
        print("-----------------------TOKEN------------------------\n", headers)
        return headers as [String : String]
    }
    
    class func shared() -> TokenHeaders {
        return sharedReference
    }
    
}
