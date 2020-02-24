//
//    Author.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class Author : NSObject, NSCoding, Mappable{

    var email : String?
    var id : Int?
    var imagePath : String?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return Author()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        email <- map["email"]
        id <- map["id"]
        imagePath <- map["image_path"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         email = aDecoder.decodeObject(forKey: "email") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imagePath != nil{
            aCoder.encode(imagePath, forKey: "image_path")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
