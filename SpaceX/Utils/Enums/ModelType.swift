//
//  ModelType.swift
//  SpaceX
//
//  Created by Karim Sakr on 04/11/2023.
//

import Foundation


enum ModelType {
    case launch
    case rocket(id:String)
    
    var toString: String {
        switch self {
        case .launch:
            return "launches"
        case .rocket(let id):
            return "rockets/\(id)"
        }
    }
    
    var toType: Any {
        switch self {
        case .launch:
            return [Launch].self
        case .rocket(_):
            return Rocket.self
        }
    }
}
