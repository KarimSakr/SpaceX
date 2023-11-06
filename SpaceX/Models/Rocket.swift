//
//  Rocket.swift
//  SpaceX
//
//  Created by Karim Sakr on 30/10/2023.
//

import Foundation

struct Rocket: Codable {
    
    
    var name        : String           = ""
    var number      : String           = ""
    var wikipedia   : String           = ""
    var description : String           = ""
    var id          : String           = ""
    var flickrImages: [String]         = []
    var firstFlight : String           = ""
    
    enum CodingKeys: String, CodingKey {
        
    
        case name           = "name"
        case number         = "number"
        case wikipedia      = "wikipedia"
        case description    = "description"
        case id             = "id"
        case flickrImages   = "flickr_images"
        case firstFlight    = "first_flight"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
     
        name         = try values.decodeIfPresent(String.self           , forKey: .name           ) ?? ""
        number       = try values.decodeIfPresent(String.self           , forKey: .number         ) ?? ""
        wikipedia    = try values.decodeIfPresent(String.self           , forKey: .wikipedia      ) ?? ""
        description  = try values.decodeIfPresent(String.self           , forKey: .description    ) ?? ""
        id           = try values.decodeIfPresent(String.self           , forKey: .id             ) ?? ""
        flickrImages = try values.decodeIfPresent([String].self         , forKey: .flickrImages   ) ?? []
        firstFlight  = try values.decodeIfPresent(String.self           , forKey: .firstFlight    ) ?? ""
        
    }
    
    init() {
        
    }
    
}

