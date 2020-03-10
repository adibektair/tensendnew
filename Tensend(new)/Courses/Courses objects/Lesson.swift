//
//	Lesson.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Lesson : NSObject, NSCoding, Mappable{

	var access : Bool?
	var courseId : Int?
	var durationTime : Int?
	var free : Int?
	var id : Int?
	var imgPath : String?
	var passed : Bool?
	var title : String?


	class func newInstance(map: Map) -> Mappable?{
		return Lesson()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		access <- map["access"]
		courseId <- map["course_id"]
		durationTime <- map["duration_time"]
		free <- map["free"]
		id <- map["id"]
		imgPath <- map["img_path"]
		passed <- map["passed"]
		title <- map["title"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         access = aDecoder.decodeObject(forKey: "access") as? Bool
         courseId = aDecoder.decodeObject(forKey: "course_id") as? Int
         durationTime = aDecoder.decodeObject(forKey: "duration_time") as? Int
         free = aDecoder.decodeObject(forKey: "free") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imgPath = aDecoder.decodeObject(forKey: "img_path") as? String
         passed = aDecoder.decodeObject(forKey: "passed") as? Bool
         title = aDecoder.decodeObject(forKey: "title") as? String

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
		if courseId != nil{
			aCoder.encode(courseId, forKey: "course_id")
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
		if passed != nil{
			aCoder.encode(passed, forKey: "passed")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}

	}

}
