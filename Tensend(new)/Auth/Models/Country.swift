//
//  Country.swift
//  Tensend(new)
//
//  Created by root user on 2/3/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import Foundation
import ObjectMapper


class CountriesResponse : NSObject, NSCoding, Mappable{

    var countries : [Country]?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return CountriesResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        countries <- map["countries"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         countries = aDecoder.decodeObject(forKey: "countries") as? [Country]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if countries != nil{
            aCoder.encode(countries, forKey: "countries")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}

class Country : NSObject, NSCoding, Mappable{

    var id : Int?
    var imagePath : String?
    var name : String?
    var phonePrefix : String?


    class func newInstance(map: Map) -> Mappable?{
        return Country()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        imagePath <- map["image_path"]
        name <- map["name"]
        phonePrefix <- map["phone_prefix"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         phonePrefix = aDecoder.decodeObject(forKey: "phone_prefix") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imagePath != nil{
            aCoder.encode(imagePath, forKey: "image_path")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if phonePrefix != nil{
            aCoder.encode(phonePrefix, forKey: "phone_prefix")
        }

    }

}
