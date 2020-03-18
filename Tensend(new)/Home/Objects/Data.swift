//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Data : NSObject, NSCoding, Mappable{
    
    var categoryTypeId : Int?
    var createdAt : String?
    var deletedAt : AnyObject?
    var id : Int?
    var imgPath : String?
    var name : String?
    var parentCategoryId : Int?
    var updatedAt : String?
    
    var categoryId : Int?
    var descriptionField : String?
    var durationTime : Int?
    var title : String?
    //For courses
    var author : Author?
    var authorId : AnyObject?
    var imagePath : String?
    var informationList : [String]?
    var isVisible : Int?
    var lessonsCount : Int?
    var lessonsPassingCount : Int?
    var scale : Int?
    var viewCount : Int?
    var started : Bool?
    
    class func newInstance(map: Map) -> Mappable?{
        return Data()
    }
    required init?(map: Map){}
    override init(){}
    
    func mapping(map: Map)
    {
        categoryId <- map["category_id"]
        categoryTypeId <- map["category_type_id"]
        createdAt <- map["created_at"]
        deletedAt <- map["deleted_at"]
        descriptionField <- map["description"]
        durationTime <- map["duration_time"]
        id <- map["id"]
        imgPath <- map["img_path"]
        imagePath <- map["img_path"]
        name <- map["name"]
        parentCategoryId <- map["parent_category_id"]
        title <- map["title"]
        updatedAt <- map["updated_at"]
        
        author <- map["author"]
        authorId <- map["author_id"]
        imagePath <- map["image_path"]
        informationList <- map["information_list"]
        isVisible <- map["is_visible"]
        lessonsCount <- map["lessons_count"]
        lessonsPassingCount <- map["lessons_passing_count"]
        scale <- map["scale"]
        viewCount <- map["view_count"]
        started <- map["started"]
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        categoryTypeId = aDecoder.decodeObject(forKey: "category_type_id") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? AnyObject
        id = aDecoder.decodeObject(forKey: "id") as? Int
        imgPath = aDecoder.decodeObject(forKey: "img_path") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        parentCategoryId = aDecoder.decodeObject(forKey: "parent_category_id") as? Int
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        author = aDecoder.decodeObject(forKey: "author") as? Author
        authorId = aDecoder.decodeObject(forKey: "author_id") as? AnyObject
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? Int
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        imagePath = aDecoder.decodeObject(forKey: "image_path") as? String
        informationList = aDecoder.decodeObject(forKey: "information_list") as? [String]
        isVisible = aDecoder.decodeObject(forKey: "is_visible") as? Int
        lessonsCount = aDecoder.decodeObject(forKey: "lessons_count") as? Int
        lessonsPassingCount = aDecoder.decodeObject(forKey: "lessons_passing_count") as? Int
        scale = aDecoder.decodeObject(forKey: "scale") as? Int
        title = aDecoder.decodeObject(forKey: "title") as? String
        viewCount = aDecoder.decodeObject(forKey: "view_count") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if categoryTypeId != nil{
            aCoder.encode(categoryTypeId, forKey: "category_type_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deleted_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imgPath != nil{
            aCoder.encode(imgPath, forKey: "img_path")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if parentCategoryId != nil{
            aCoder.encode(parentCategoryId, forKey: "parent_category_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        
    }
    
}
