//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class MeditationsResponse : NSObject, NSCoding, Mappable{

	var meditations : Meditation?
	var success : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return MeditationsResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		meditations <- map["meditations"]
		success <- map["success"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         meditations = aDecoder.decodeObject(forKey: "meditations") as? Meditation
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if meditations != nil{
			aCoder.encode(meditations, forKey: "meditations")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}
