//
//  Links.swift
//  SpaceX
//
//  Created by Karim Sakr on 01/11/2023.
//

import Foundation
import RealmSwift

class Links: Object, Codable, Identifiable {
   
    
   @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var patch     : Patch?   = nil
    @Persisted var wikipedia : String   = ""
    
    enum CodingKeys: String, CodingKey {
        
        case patch     = "patch"
        case wikipedia = "wikipedia"
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        patch     = try values.decodeIfPresent(Patch.self    , forKey: .patch     )
        wikipedia = try values.decodeIfPresent(String.self   , forKey: .wikipedia ) ?? ""
        
    }
    
    override init() {
        
    }
    
}

