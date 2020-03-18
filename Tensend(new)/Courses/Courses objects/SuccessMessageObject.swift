//
//  SuccessMessageObject.swift
//  Tensend(new)
//
//  Created by Sultan on 3/15/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import ObjectMapper


class SuccessMessageObject : NSObject, Mappable{

    var success : Bool?
    var message : String?


    class func newInstance(map: Map) -> Mappable?{
        return SuccessMessageObject()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        success <- map["success"]
        message <- map["message"]
    }


}
