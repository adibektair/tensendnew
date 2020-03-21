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
    var surname: String?

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
        surname <- map["surname"]
        
        
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


class Language : NSObject, NSCoding, Mappable{

    var id : Int?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return Language()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String

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
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}


class Audio : NSObject, NSCoding, Mappable{

    var access : Bool?
    var audioPath : String?
    var author : Author?
    var duration : Int?
    var free : Int?
    var id : Int?
    var imgPath : String?
    var language : Language?


    class func newInstance(map: Map) -> Mappable?{
        return Audio()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        access <- map["access"]
        audioPath <- map["audio_path"]
        author <- map["author"]
        duration <- map["duration"]
        free <- map["free"]
        id <- map["id"]
        imgPath <- map["img_path"]
        language <- map["language"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         access = aDecoder.decodeObject(forKey: "access") as? Bool
         audioPath = aDecoder.decodeObject(forKey: "audio_path") as? String
         author = aDecoder.decodeObject(forKey: "author") as? Author
         duration = aDecoder.decodeObject(forKey: "duration") as? Int
         free = aDecoder.decodeObject(forKey: "free") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imgPath = aDecoder.decodeObject(forKey: "img_path") as? String
         language = aDecoder.decodeObject(forKey: "language") as? Language

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if access != nil{
            aCoder.encode(access, forKey: "access")
        }
        if audioPath != nil{
            aCoder.encode(audioPath, forKey: "audio_path")
        }
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if duration != nil{
            aCoder.encode(duration, forKey: "duration")
        }
        if free != nil{
            aCoder.encode(free, forKey: "free")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imgPath != nil{
            aCoder.encode(imgPath, forKey: "img_path")
        }
        if language != nil{
            aCoder.encode(language, forKey: "language")
        }

    }

}
