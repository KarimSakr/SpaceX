//
//  Launch.swift
//  SpaceX
//
//  Created by Karim Sakr on 30/10/2023.
//

import Foundation
import RealmSwift

class Launch: Object, Codable, Identifiable, ObjectKeyIdentifiable {
    
   @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var links       : Links?     = nil
    @Persisted var rocket      : String     = ""
    @Persisted var success     : Bool       = false
    @Persisted var details     : String     = ""
    @Persisted var flightNumber: Int        = 0
    @Persisted var name        : String     = ""
    @Persisted var dateUtc     : String     = ""
    @Persisted var dateUnix    : Int        = 0
    @Persisted var dateLocal   : String     = ""
    @Persisted var upcoming    : Bool       = false
    
    enum CodingKeys: String, CodingKey {
        
        
        case rocket       = "rocket"
        case links        = "links"
        case success      = "success"
        case details      = "details"
        case flightNumber = "flight_number"
        case name         = "name"
        case dateUtc      = "date_utc"
        case dateUnix     = "date_unix"
        case dateLocal    = "date_local"
        case upcoming     = "upcoming"
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        
        rocket             = try values.decodeIfPresent(String.self     , forKey: .rocket             ) ?? ""
        success            = try values.decodeIfPresent(Bool.self       , forKey: .success            ) ?? false
        details            = try values.decodeIfPresent(String.self     , forKey: .details            ) ?? ""
        flightNumber       = try values.decodeIfPresent(Int.self        , forKey: .flightNumber       ) ?? 0
        name               = try values.decodeIfPresent(String.self     , forKey: .name               ) ?? ""
        dateUtc            = try values.decodeIfPresent(String.self     , forKey: .dateUtc            ) ?? ""
        dateUnix           = try values.decodeIfPresent(Int.self        , forKey: .dateUnix           ) ?? 0
        dateLocal          = try values.decodeIfPresent(String.self     , forKey: .dateLocal          ) ?? ""
        upcoming           = try values.decodeIfPresent(Bool.self       , forKey: .upcoming           ) ?? false
        links              = try values.decodeIfPresent(Links.self      , forKey: .links              )
        
    }
    
    override init() {
    }
    
}
