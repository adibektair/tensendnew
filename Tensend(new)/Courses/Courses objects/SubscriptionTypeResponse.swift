//
//	SubscriptionTypeResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class SubscriptionTypeResponse : NSObject, NSCoding, Mappable{

	var subscriptionTypes : [SubscriptionType]?
	var success : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return SubscriptionTypeResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		subscriptionTypes <- map["subscription_types"]
		success <- map["success"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         subscriptionTypes = aDecoder.decodeObject(forKey: "subscription_types") as? [SubscriptionType]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if subscriptionTypes != nil{
			aCoder.encode(subscriptionTypes, forKey: "subscription_types")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}