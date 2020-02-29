//
//	ForMe.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ForMe : NSObject, NSCoding, Mappable{

	var courses : Course?
    var course : Course?
	var success : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return ForMe()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		courses <- map["courses"]
        courses <- map["course"]
		success <- map["success"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         courses = aDecoder.decodeObject(forKey: "courses") as? Course
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if courses != nil{
			aCoder.encode(courses, forKey: "courses")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}
