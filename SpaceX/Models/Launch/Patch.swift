//
//  Patch.swift
//  SpaceX
//
//  Created by Karim Sakr on 06/11/2023.
//

import Foundation
import RealmSwift

class Patch: Object, Codable, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var large: String = ""
    @Persisted var small: String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case large = "large"
        case small = "small"
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        large = try values.decodeIfPresent(String.self, forKey: .large) ?? ""
        small = try values.decodeIfPresent(String.self, forKey: .small) ?? ""
    }
    
    override init() {
        
    }
    
}

