//
//  Document.swift
//  Tensend(new)
//
//  Created by Sultan on 3/4/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class Document : NSObject, NSCoding, Mappable{

    var courseMaterialId : Int?
    var docPath : String?
    var id : Int?
    var type : String?


    class func newInstance(map: Map) -> Mappable?{
        return Document()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        courseMaterialId <- map["course_material_id"]
        docPath <- map["doc_path"]
        id <- map["id"]
        type <- map["type"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         courseMaterialId = aDecoder.decodeObject(forKey: "course_material_id") as? Int
         docPath = aDecoder.decodeObject(forKey: "doc_path") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if courseMaterialId != nil{
            aCoder.encode(courseMaterialId, forKey: "course_material_id")
        }
        if docPath != nil{
            aCoder.encode(docPath, forKey: "doc_path")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }

    }

}
