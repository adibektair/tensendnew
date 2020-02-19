//
//	Banner.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Banner : NSObject, NSCoding, Mappable{

	var createdAt : String?
	var id : Int?
	var imagePath : String?
	var locationId : Int?
	var newsId : Int?
	var title : String?
	var updatedAt : String?


	class func newInstance(map: Map) -> Mappable?{
		return Banner()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		createdAt <- map["created_at"]
		id <- map["id"]
		imagePath <- map["image_path"]
		locationId <- map["location_id"]
		newsId <- map["news_id"]
		title <- map["title"]
		updatedAt <- map["updated_at"]
		
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
         locationId = aDecoder.decodeObject(forKey: "location_id") as? Int
         newsId = aDecoder.decodeObject(forKey: "news_id") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
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
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if imagePath != nil{
			aCoder.encode(imagePath, forKey: "image_path")
		}
		if locationId != nil{
			aCoder.encode(locationId, forKey: "location_id")
		}
		if newsId != nil{
			aCoder.encode(newsId, forKey: "news_id")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}