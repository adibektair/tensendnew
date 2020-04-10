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

class Link : NSObject, NSCoding, Mappable{

    var imgPath : AnyObject?
    var title : String?
    var url : String?


    class func newInstance(map: Map) -> Mappable?{
        return Link()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        imgPath <- map["img_path"]
        title <- map["title"]
        url <- map["url"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         imgPath = aDecoder.decodeObject(forKey: "img_path") as? AnyObject
         title = aDecoder.decodeObject(forKey: "title") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if imgPath != nil{
            aCoder.encode(imgPath, forKey: "img_path")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }

    }

}

class Tensend : NSObject, NSCoding, Mappable{

    var aboutUs : String?
    var address : String?
    var copyright : String?
    var imgPath : String?
    var links : [Link]?
    var phone : String?
    var title : String?


    class func newInstance(map: Map) -> Mappable?{
        return Tensend()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        aboutUs <- map["about_us"]
        address <- map["address"]
        copyright <- map["copyright"]
        imgPath <- map["img_path"]
        links <- map["links"]
        phone <- map["phone"]
        title <- map["title"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         aboutUs = aDecoder.decodeObject(forKey: "about_us") as? String
         address = aDecoder.decodeObject(forKey: "address") as? String
         copyright = aDecoder.decodeObject(forKey: "copyright") as? String
         imgPath = aDecoder.decodeObject(forKey: "img_path") as? String
         links = aDecoder.decodeObject(forKey: "links") as? [Link]
         phone = aDecoder.decodeObject(forKey: "phone") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if aboutUs != nil{
            aCoder.encode(aboutUs, forKey: "about_us")
        }
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if copyright != nil{
            aCoder.encode(copyright, forKey: "copyright")
        }
        if imgPath != nil{
            aCoder.encode(imgPath, forKey: "img_path")
        }
        if links != nil{
            aCoder.encode(links, forKey: "links")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }

}


class AboutTensend : NSObject, NSCoding, Mappable{

    var success : Bool?
    var tensend : Tensend?


    class func newInstance(map: Map) -> Mappable?{
        return AboutTensend()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        success <- map["success"]
        tensend <- map["tensend"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         success = aDecoder.decodeObject(forKey: "success") as? Bool
         tensend = aDecoder.decodeObject(forKey: "tensend") as? Tensend

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }
        if tensend != nil{
            aCoder.encode(tensend, forKey: "tensend")
        }

    }

}
