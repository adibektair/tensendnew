//
//	Categories.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class CategoriesResponse : NSObject, NSCoding, Mappable{

	var categories : Category?
	var success : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return CategoriesResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		categories <- map["categories"]
		success <- map["success"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         categories = aDecoder.decodeObject(forKey: "categories") as? Category
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if categories != nil{
			aCoder.encode(categories, forKey: "categories")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}
