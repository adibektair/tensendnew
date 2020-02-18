//
//	BannersResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class BannersResponse : NSObject, NSCoding, Mappable{

	var banners : [Banner]?
	var success : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return BannersResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		banners <- map["banners"]
		success <- map["success"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         banners = aDecoder.decodeObject(forKey: "banners") as? [Banner]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if banners != nil{
			aCoder.encode(banners, forKey: "banners")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}