//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Data : NSObject, NSCoding, Mappable{

	var categoryTypeId : Int?
	var createdAt : String?
	var deletedAt : AnyObject?
	var id : Int?
	var imgPath : String?
	var name : String?
	var parentCategoryId : Int?
	var updatedAt : String?
    
    var categoryId : Int?
    var descriptionField : String?
    var durationTime : Int?
    var title : String?



	class func newInstance(map: Map) -> Mappable?{
		return Data()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
        categoryId <- map["category_id"]
		categoryTypeId <- map["category_type_id"]
		createdAt <- map["created_at"]
		deletedAt <- map["deleted_at"]
        descriptionField <- map["description"]
        durationTime <- map["duration_time"]
		id <- map["id"]
		imgPath <- map["img_path"]
		name <- map["name"]
		parentCategoryId <- map["parent_category_id"]
        title <- map["title"]
		updatedAt <- map["updated_at"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         categoryTypeId = aDecoder.decodeObject(forKey: "category_type_id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imgPath = aDecoder.decodeObject(forKey: "img_path") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         parentCategoryId = aDecoder.decodeObject(forKey: "parent_category_id") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if categoryTypeId != nil{
			aCoder.encode(categoryTypeId, forKey: "category_type_id")
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
		if imgPath != nil{
			aCoder.encode(imgPath, forKey: "img_path")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if parentCategoryId != nil{
			aCoder.encode(parentCategoryId, forKey: "parent_category_id")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}
