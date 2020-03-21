//
//	SubscriptionType.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class SubscriptionType : NSObject, NSCoding, Mappable{

	var createdAt : String?
	var expiredAt : Int?
	var id : Int?
	var name : String?
	var price : Int?
	var updatedAt : String?


	class func newInstance(map: Map) -> Mappable?{
		return SubscriptionType()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		createdAt <- map["created_at"]
		expiredAt <- map["expired_at"]
		id <- map["id"]
		name <- map["name"]
		price <- map["price"]
		updatedAt <- map["updated_at"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         expiredAt = aDecoder.decodeObject(forKey: "expired_at") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
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
		if expiredAt != nil{
			aCoder.encode(expiredAt, forKey: "expired_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}