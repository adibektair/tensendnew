//
//	Course.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Course : NSObject, NSCoding, Mappable{

	var currentPage : Int?
	var data : [DataObject]?
    var dataAll = [DataObject]()
	var firstPageUrl : String?
	var from : Int?
	var lastPage : Int?
	var lastPageUrl : String?
	var nextPageUrl : String?
	var path : String?
	var perPage : Int?
	var prevPageUrl : AnyObject?
	var to : Int?
	var total : Int?
    var inprogress = false
    var counter = 2

    
    var access : Bool?
    var author : Author?
    var authorId : Int?
    var categoryId : Int?
    var createdAt : String?
    var deletedAt : AnyObject?
    var descriptionField : String?
    var id : Int?
    var imagePath : String?
    var informationList : [String]?
    var isVisible : Int?
    var lessons : [Lesson]?
    var lessonsCount : Int?
    var lessonsPassingCount : Int?
    var scale : Int?
    var started : Bool?
    var title : String?
    var trailer : String?
    var updatedAt : String?
    var viewCount : Int?

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
             HomeRequests.sharedInstance.getForMe(page: counter) { (result) in
                 self.data?.append(contentsOf: result.courses?.data ?? [])
                 self.resetList()
                 self.counter += 1
                 self.inprogress = false
                 done()
             }
          }
      }
	class func newInstance(map: Map) -> Mappable?{
		return Course()
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
        
        access <- map["access"]
        author <- map["author"]
        authorId <- map["author_id"]
        categoryId <- map["category_id"]
        createdAt <- map["created_at"]
        deletedAt <- map["deleted_at"]
        descriptionField <- map["description"]
        id <- map["id"]
        imagePath <- map["image_path"]
        informationList <- map["information_list"]
        isVisible <- map["is_visible"]
        lessons <- map["lessons"]
        lessonsCount <- map["lessons_count"]
        lessonsPassingCount <- map["lessons_passing_count"]
        scale <- map["scale"]
        started <- map["started"]
        title <- map["title"]
        trailer <- map["trailer"]
        updatedAt <- map["updated_at"]
        viewCount <- map["view_count"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         currentPage = aDecoder.decodeObject(forKey: "current_page") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? [DataObject]
         firstPageUrl = aDecoder.decodeObject(forKey: "first_page_url") as? String
         from = aDecoder.decodeObject(forKey: "from") as? Int
         lastPage = aDecoder.decodeObject(forKey: "last_page") as? Int
         lastPageUrl = aDecoder.decodeObject(forKey: "last_page_url") as? String
         nextPageUrl = aDecoder.decodeObject(forKey: "next_page_url") as? String
         path = aDecoder.decodeObject(forKey: "path") as? String
         perPage = aDecoder.decodeObject(forKey: "per_page") as? Int
         prevPageUrl = aDecoder.decodeObject(forKey: "prev_page_url") as? AnyObject
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
