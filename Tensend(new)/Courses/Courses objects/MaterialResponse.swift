//
//	MaterialResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class MaterialResponse : NSObject, NSCoding, Mappable{

	var material : Material?
	var success : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return MaterialResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		material <- map["material"]
		success <- map["success"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         material = aDecoder.decodeObject(forKey: "material") as? Material
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if material != nil{
			aCoder.encode(material, forKey: "material")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}