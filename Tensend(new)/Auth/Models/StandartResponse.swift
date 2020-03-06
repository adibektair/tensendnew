//
//  StandartResponse.swift
//  Tensend(new)
//
//  Created by root user on 2/5/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import ObjectMapper


class StandartResponse : NSObject, NSCoding, Mappable{

    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return StandartResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        message <- map["message"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         message = aDecoder.decodeObject(forKey: "message") as? String
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}



class RegisterResponse : NSObject, NSCoding, Mappable{

    var token : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return RegisterResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        token <- map["token"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         token = aDecoder.decodeObject(forKey: "token") as? String
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if token != nil{
            aCoder.encode(token, forKey: "token")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}

class LinkResponse : NSObject, NSCoding, Mappable{

    var link : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return LinkResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        link <- map["link"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         link = aDecoder.decodeObject(forKey: "link") as? String
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if link != nil{
            aCoder.encode(link, forKey: "link")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}
