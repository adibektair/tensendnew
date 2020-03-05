//
//	Material.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Material : NSObject, NSCoding, Mappable{

	var course : Course?
	var courseId : Int?
	var createdAt : String?
	var descriptionField : String?
	var documents : [Document]?
	var durationTime : Int?
	var free : Int?
	var id : Int?
	var imgPath : String?
	var ordering : Int?
	var title : String?
	var updatedAt : String?
	var videoPath : String?
	var viewCount : Int?


	class func newInstance(map: Map) -> Mappable?{
		return Material()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		course <- map["course"]
		courseId <- map["course_id"]
		createdAt <- map["created_at"]
		descriptionField <- map["description"]
		documents <- map["documents"]
		durationTime <- map["duration_time"]
		free <- map["free"]
		id <- map["id"]
		imgPath <- map["img_path"]
		ordering <- map["ordering"]
		title <- map["title"]
		updatedAt <- map["updated_at"]
		videoPath <- map["video_path"]
		viewCount <- map["view_count"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         course = aDecoder.decodeObject(forKey: "course") as? Course
         courseId = aDecoder.decodeObject(forKey: "course_id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         documents = aDecoder.decodeObject(forKey: "documents") as? [Document]
         durationTime = aDecoder.decodeObject(forKey: "duration_time") as? Int
         free = aDecoder.decodeObject(forKey: "free") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imgPath = aDecoder.decodeObject(forKey: "img_path") as? String
         ordering = aDecoder.decodeObject(forKey: "ordering") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         videoPath = aDecoder.decodeObject(forKey: "video_path") as? String
         viewCount = aDecoder.decodeObject(forKey: "view_count") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if course != nil{
			aCoder.encode(course, forKey: "course")
		}
		if courseId != nil{
			aCoder.encode(courseId, forKey: "course_id")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if documents != nil{
			aCoder.encode(documents, forKey: "documents")
		}
		if durationTime != nil{
			aCoder.encode(durationTime, forKey: "duration_time")
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
		if ordering != nil{
			aCoder.encode(ordering, forKey: "ordering")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if videoPath != nil{
			aCoder.encode(videoPath, forKey: "video_path")
		}
		if viewCount != nil{
			aCoder.encode(viewCount, forKey: "view_count")
		}

	}

}
