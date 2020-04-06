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


class Analyze : NSObject, NSCoding, Mappable{

    var count : Int?
    var type : Int?


    class func newInstance(map: Map) -> Mappable?{
        return Analyze()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        count <- map["count"]
        type <- map["type"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         count = aDecoder.decodeObject(forKey: "count") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if count != nil{
            aCoder.encode(count, forKey: "count")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }

    }

}



class Profile : NSObject, NSCoding, Mappable{

    var activity : Int?
    var analyze : [Analyze]?
    var avatar : String?
    var balance : Int?
    var city : String?
    var created : String?
    var discountPercentage : Int?
    var fatherName : String?
    var followersCount : Int?
    var id : Int?
    var level : String?
    var levelId : Int?

    var levelImage : String?
    var name : String?
    var nickname : AnyObject?
    var passed : Int?
    var permission : Bool?
    var phone : String?
    var promoCode : String?
    var rating : Int?
    var role : String?
    var subscriptions : [AnyObject]?
    var surname : String?
    var tensend : Int?
    var clicks_count : Int?
    var registrations_count : Int?
    var subscriptions_count : Int?
    var requests_count : Int?
    var levels : [Level]?


    class func newInstance(map: Map) -> Mappable?{
        return Profile()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        activity <- map["activity"]
        analyze <- map["analyze"]
        avatar <- map["avatar"]
        balance <- map["balance"]
        city <- map["city"]
        created <- map["created"]
        discountPercentage <- map["discountPercentage"]
        fatherName <- map["fatherName"]
        followersCount <- map["followers_count"]
        id <- map["id"]
        level <- map["level"]
        levelImage <- map["levelImage"]
        name <- map["name"]
        nickname <- map["nickname"]
        passed <- map["passed"]
        permission <- map["permission"]
        phone <- map["phone"]
        promoCode <- map["promoCode"]
        rating <- map["rating"]
        role <- map["role"]
        subscriptions <- map["subscriptions"]
        surname <- map["surname"]
        tensend <- map["tensend"]
        requests_count <- map["requests_count"]
        subscriptions_count <- map["subscriptions_count"]
        registrations_count <- map["registrations_count"]
        clicks_count <- map["clicks_count"]
        levels <- map["levels"]
        levelId <- map["levelId"]
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         activity = aDecoder.decodeObject(forKey: "activity") as? Int
         analyze = aDecoder.decodeObject(forKey: "analyze") as? [Analyze]
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         balance = aDecoder.decodeObject(forKey: "balance") as? Int
         city = aDecoder.decodeObject(forKey: "city") as? String
         created = aDecoder.decodeObject(forKey: "created") as? String
         discountPercentage = aDecoder.decodeObject(forKey: "discountPercentage") as? Int
         fatherName = aDecoder.decodeObject(forKey: "fatherName") as? String
         followersCount = aDecoder.decodeObject(forKey: "followers_count") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         level = aDecoder.decodeObject(forKey: "level") as? String
         levelImage = aDecoder.decodeObject(forKey: "levelImage") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         nickname = aDecoder.decodeObject(forKey: "nickname") as? AnyObject
         passed = aDecoder.decodeObject(forKey: "passed") as? Int
         permission = aDecoder.decodeObject(forKey: "permission") as? Bool
         phone = aDecoder.decodeObject(forKey: "phone") as? String
         promoCode = aDecoder.decodeObject(forKey: "promoCode") as? String
         rating = aDecoder.decodeObject(forKey: "rating") as? Int
         role = aDecoder.decodeObject(forKey: "role") as? String
         subscriptions = aDecoder.decodeObject(forKey: "subscriptions") as? [AnyObject]
         surname = aDecoder.decodeObject(forKey: "surname") as? String
         tensend = aDecoder.decodeObject(forKey: "tensend") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if activity != nil{
            aCoder.encode(activity, forKey: "activity")
        }
        if analyze != nil{
            aCoder.encode(analyze, forKey: "analyze")
        }
        if avatar != nil{
            aCoder.encode(avatar, forKey: "avatar")
        }
        if balance != nil{
            aCoder.encode(balance, forKey: "balance")
        }
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if created != nil{
            aCoder.encode(created, forKey: "created")
        }
        if discountPercentage != nil{
            aCoder.encode(discountPercentage, forKey: "discountPercentage")
        }
        if fatherName != nil{
            aCoder.encode(fatherName, forKey: "fatherName")
        }
        if followersCount != nil{
            aCoder.encode(followersCount, forKey: "followers_count")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if level != nil{
            aCoder.encode(level, forKey: "level")
        }
        if levelImage != nil{
            aCoder.encode(levelImage, forKey: "levelImage")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if nickname != nil{
            aCoder.encode(nickname, forKey: "nickname")
        }
        if passed != nil{
            aCoder.encode(passed, forKey: "passed")
        }
        if permission != nil{
            aCoder.encode(permission, forKey: "permission")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if promoCode != nil{
            aCoder.encode(promoCode, forKey: "promoCode")
        }
        if rating != nil{
            aCoder.encode(rating, forKey: "rating")
        }
        if role != nil{
            aCoder.encode(role, forKey: "role")
        }
        if subscriptions != nil{
            aCoder.encode(subscriptions, forKey: "subscriptions")
        }
        if surname != nil{
            aCoder.encode(surname, forKey: "surname")
        }
        if tensend != nil{
            aCoder.encode(tensend, forKey: "tensend")
        }

    }

}

class ProfileResponse : NSObject, NSCoding, Mappable{

    var profile : Profile?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return ProfileResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        profile <- map["profile"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         profile = aDecoder.decodeObject(forKey: "profile") as? Profile
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if profile != nil{
            aCoder.encode(profile, forKey: "profile")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}


class Rating : NSObject, NSCoding, Mappable{

    var fatherName : String?
    var id : Int?
    var imagePath : String?
    var levelId : Int?
    var logo : String?
    var name : String?
    var rating : Int?
    var surname : String?


    class func newInstance(map: Map) -> Mappable?{
        return Rating()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        fatherName <- map["father_name"]
        id <- map["id"]
        imagePath <- map["image_path"]
        levelId <- map["level_id"]
        logo <- map["logo"]
        name <- map["name"]
        rating <- map["rating"]
        surname <- map["surname"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         fatherName = aDecoder.decodeObject(forKey: "father_name") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
         levelId = aDecoder.decodeObject(forKey: "level_id") as? Int
         logo = aDecoder.decodeObject(forKey: "logo") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         rating = aDecoder.decodeObject(forKey: "rating") as? Int
         surname = aDecoder.decodeObject(forKey: "surname") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if fatherName != nil{
            aCoder.encode(fatherName, forKey: "father_name")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imagePath != nil{
            aCoder.encode(imagePath, forKey: "image_path")
        }
        if levelId != nil{
            aCoder.encode(levelId, forKey: "level_id")
        }
        if logo != nil{
            aCoder.encode(logo, forKey: "logo")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if rating != nil{
            aCoder.encode(rating, forKey: "rating")
        }
        if surname != nil{
            aCoder.encode(surname, forKey: "surname")
        }

    }

}


class RatingResponse : NSObject, NSCoding, Mappable{

    var ratings : [Rating]?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return RatingResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        ratings <- map["ratings"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         ratings = aDecoder.decodeObject(forKey: "ratings") as? [Rating]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if ratings != nil{
            aCoder.encode(ratings, forKey: "ratings")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}


class MarketingResponse : NSObject, NSCoding, Mappable{

    var materials : [MarketingMaterial]?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return MarketingResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        materials <- map["materials"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         materials = aDecoder.decodeObject(forKey: "materials") as? [MarketingMaterial]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if materials != nil{
            aCoder.encode(materials, forKey: "materials")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}


class MarketingMaterial : NSObject, NSCoding, Mappable{

    var createdAt : String?
    var id : Int?
    var imagePath : String?
    var name : String?
    var updatedAt : String?
    var url : String?


    class func newInstance(map: Map) -> Mappable?{
        return MarketingMaterial()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        id <- map["id"]
        imagePath <- map["image_path"]
        name <- map["name"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
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
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }

    }

}

class Level : NSObject, NSCoding, Mappable{
    
    var createdAt : String?
    var descriptionField : String?
    var discountPercentage : Int?
    var endCount : Int?
    var id : Int?
    var logo : String?
    var name : String?
    var periodDate : Int?
    var startCount : Int?
    var updatedAt : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Level()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        descriptionField <- map["description"]
        discountPercentage <- map["discount_percentage"]
        endCount <- map["end_count"]
        id <- map["id"]
        logo <- map["logo"]
        name <- map["name"]
        periodDate <- map["period_date"]
        startCount <- map["start_count"]
        updatedAt <- map["updated_at"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        discountPercentage = aDecoder.decodeObject(forKey: "discount_percentage") as? Int
        endCount = aDecoder.decodeObject(forKey: "end_count") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        logo = aDecoder.decodeObject(forKey: "logo") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        periodDate = aDecoder.decodeObject(forKey: "period_date") as? Int
        startCount = aDecoder.decodeObject(forKey: "start_count") as? Int
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if discountPercentage != nil{
            aCoder.encode(discountPercentage, forKey: "discount_percentage")
        }
        if endCount != nil{
            aCoder.encode(endCount, forKey: "end_count")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if logo != nil{
            aCoder.encode(logo, forKey: "logo")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if periodDate != nil{
            aCoder.encode(periodDate, forKey: "period_date")
        }
        if startCount != nil{
            aCoder.encode(startCount, forKey: "start_count")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        
    }
    
}

class Certificate : NSObject, NSCoding, Mappable{

    var author : Author?
    var id : Int?
    var imagePath : String?
    var lessonsCount : Int?
    var title : String?


    class func newInstance(map: Map) -> Mappable?{
        return Certificate()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        author <- map["author"]
        id <- map["id"]
        imagePath <- map["image_path"]
        lessonsCount <- map["lessons_count"]
        title <- map["title"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         author = aDecoder.decodeObject(forKey: "author") as? Author
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
         lessonsCount = aDecoder.decodeObject(forKey: "lessons_count") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imagePath != nil{
            aCoder.encode(imagePath, forKey: "image_path")
        }
        if lessonsCount != nil{
            aCoder.encode(lessonsCount, forKey: "lessons_count")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }

}


class CertificatesResponse : NSObject, NSCoding, Mappable{

    var certificates : [DataObject]?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return CertificatesResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        certificates <- map["certificates"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         certificates = aDecoder.decodeObject(forKey: "certificates") as? [DataObject]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if certificates != nil{
            aCoder.encode(certificates, forKey: "certificates")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}


class FaqResponse : NSObject, NSCoding, Mappable{

    var faqs : [Faq]?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return FaqResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        faqs <- map["faqs"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         faqs = aDecoder.decodeObject(forKey: "faqs") as? [Faq]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if faqs != nil{
            aCoder.encode(faqs, forKey: "faqs")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}

class Faq : NSObject, NSCoding, Mappable{

    var answer : String?
    var createdAt : String?
    var deletedAt : AnyObject?
    var id : Int?
    var imagePath : String?
    var question : String?
    var updatedAt : String?


    class func newInstance(map: Map) -> Mappable?{
        return Faq()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        answer <- map["answer"]
        createdAt <- map["created_at"]
        deletedAt <- map["deleted_at"]
        id <- map["id"]
        imagePath <- map["image_path"]
        question <- map["question"]
        updatedAt <- map["updated_at"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         answer = aDecoder.decodeObject(forKey: "answer") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
         question = aDecoder.decodeObject(forKey: "question") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if answer != nil{
            aCoder.encode(answer, forKey: "answer")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deleted_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imagePath != nil{
            aCoder.encode(imagePath, forKey: "image_path")
        }
        if question != nil{
            aCoder.encode(question, forKey: "question")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
