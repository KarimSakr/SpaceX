//
//  RealmManagerProtocol.swift
//  SpaceX
//
//  Created by Karim Sakr on 04/11/2023.
//

import Foundation

protocol RealmManagerProtocol {
 
    func saveLaunches(of allSuccessfulLaunches: [Launch])
    
    func openRealm()
    
    func getLaunches()
}
