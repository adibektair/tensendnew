//
//	Meditation.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Meditation : NSObject, NSCoding, Mappable{

	var currentPage : Int?
	var data : [Data]?
    var dataAll = [Data]()
	var firstPageUrl : String?
	var from : Int?
	var lastPage : Int?
	var lastPageUrl : String?
	var nextPageUrl : AnyObject?
	var path : String?
	var perPage : Int?
	var prevPageUrl : String?
	var to : Int?
	var total : Int?
    var inprogress = false
    var counter = 2
    
    func resetList(){
          self.dataAll.removeAll()
          if let arr = data {
              self.dataAll.append(contentsOf: arr)
          }
      }
     func loadNextPage(done:@escaping (()-> Void)){
         if inprogress { return }
         if counter <= lastPage ?? 1{
             inprogress = true
            HomeRequests.sharedInstance.getMeditations(page: counter) { (result) in
                self.data?.append(contentsOf: result.meditations?.data ?? [])
                self.resetList()
                self.counter += 1
                self.inprogress = false
                done()
            }
         }
     }
	class func newInstance(map: Map) -> Mappable?{
		return Meditation()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		currentPage <- map["current_page"]
		data <- map["data"]
		firstPageUrl <- map["first_page_url"]
		from <- map["from"]
		lastPage <- map["last_page"]
		lastPageUrl <- map["last_page_url"]
		nextPageUrl <- map["next_page_url"]
		path <- map["path"]
		perPage <- map["per_page"]
		prevPageUrl <- map["prev_page_url"]
		to <- map["to"]
		total <- map["total"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         currentPage = aDecoder.decodeObject(forKey: "current_page") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? [Data]
         firstPageUrl = aDecoder.decodeObject(forKey: "first_page_url") as? String
         from = aDecoder.decodeObject(forKey: "from") as? Int
         lastPage = aDecoder.decodeObject(forKey: "last_page") as? Int
         lastPageUrl = aDecoder.decodeObject(forKey: "last_page_url") as? String
         nextPageUrl = aDecoder.decodeObject(forKey: "next_page_url") as? AnyObject
         path = aDecoder.decodeObject(forKey: "path") as? String
         perPage = aDecoder.decodeObject(forKey: "per_page") as? Int
         prevPageUrl = aDecoder.decodeObject(forKey: "prev_page_url") as? String
         to = aDecoder.decodeObject(forKey: "to") as? Int
         total = aDecoder.decodeObject(forKey: "total") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if currentPage != nil{
			aCoder.encode(currentPage, forKey: "current_page")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if firstPageUrl != nil{
			aCoder.encode(firstPageUrl, forKey: "first_page_url")
		}
		if from != nil{
			aCoder.encode(from, forKey: "from")
		}
		if lastPage != nil{
			aCoder.encode(lastPage, forKey: "last_page")
		}
		if lastPageUrl != nil{
			aCoder.encode(lastPageUrl, forKey: "last_page_url")
		}
		if nextPageUrl != nil{
			aCoder.encode(nextPageUrl, forKey: "next_page_url")
		}
		if path != nil{
			aCoder.encode(path, forKey: "path")
		}
		if perPage != nil{
			aCoder.encode(perPage, forKey: "per_page")
		}
		if prevPageUrl != nil{
			aCoder.encode(prevPageUrl, forKey: "prev_page_url")
		}
		if to != nil{
			aCoder.encode(to, forKey: "to")
		}
		if total != nil{
			aCoder.encode(total, forKey: "total")
		}

	}

}

class SingleMeditation : NSObject, NSCoding, Mappable{

    var access : Bool?
    var audios : [Audio]?
    var descriptionField : String?
    var duration : Int?
    var imgPath : String?
    var scale : Float?
    var title : String?


    class func newInstance(map: Map) -> Mappable?{
        return SingleMeditation()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        access <- map["access"]
        audios <- map["audios"]
        descriptionField <- map["description"]
        duration <- map["duration"]
        imgPath <- map["img_path"]
        scale <- map["scale"]
        title <- map["title"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         access = aDecoder.decodeObject(forKey: "access") as? Bool
         audios = aDecoder.decodeObject(forKey: "audios") as? [Audio]
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         duration = aDecoder.decodeObject(forKey: "duration") as? Int
         imgPath = aDecoder.decodeObject(forKey: "img_path") as? String
         scale = aDecoder.decodeObject(forKey: "scale") as? Float
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
        if audios != nil{
            aCoder.encode(audios, forKey: "audios")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if duration != nil{
            aCoder.encode(duration, forKey: "duration")
        }
        if imgPath != nil{
            aCoder.encode(imgPath, forKey: "img_path")
        }
        if scale != nil{
            aCoder.encode(scale, forKey: "scale")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }

}


class SingleMeditationResponse : NSObject, NSCoding, Mappable{

    var meditation : SingleMeditation?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return SingleMeditationResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        meditation <- map["meditation"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         meditation = aDecoder.decodeObject(forKey: "meditation") as? SingleMeditation
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if meditation != nil{
            aCoder.encode(meditation, forKey: "meditation")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}
