//
//  RealmManager.swift
//  SpaceX
//
//  Created by Karim Sakr on 03/11/2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject, RealmManagerProtocol {
    
    static let shared = RealmManager()
    
    private var realm: Realm?
    var launches = [Launch]()
    
    private init() {
        openRealm()
        getLaunches()
    }
    
    
    //MARK: - Save
    func saveLaunches(of allSuccessfulLaunches: [Launch]) {
        guard let realm = realm else {
            return
        }
        
        do {
            try realm.write {
                let oldLaunches = realm.objects(Launch.self)
                
                if oldLaunches.isEmpty {
                    realm.add(allSuccessfulLaunches)
                } else {
                    
                    for newLaunch in allSuccessfulLaunches {
                        // replace items
                        if let existingLaunch = oldLaunches.first(where: { $0.id == newLaunch.id }) {
                            existingLaunch.rocket = newLaunch.rocket
                            existingLaunch.links = newLaunch.links
                            existingLaunch.success = newLaunch.success
                            existingLaunch.details = newLaunch.details
                            existingLaunch.flightNumber = newLaunch.flightNumber
                            existingLaunch.name = newLaunch.name
                            existingLaunch.dateUtc = newLaunch.dateUtc
                            existingLaunch.dateUnix = newLaunch.dateUnix
                            existingLaunch.dateLocal = newLaunch.dateLocal
                            existingLaunch.upcoming = newLaunch.upcoming
                            
                        }
                    }
                }
                
            }
            
            getLaunches()
        } catch {
            print(error.localizedDescription)
        }
    }

    
    
    func openRealm() {
        do {
            let config = Realm.Configuration()
            
            Realm.Configuration.defaultConfiguration = config
            
            realm = try Realm()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Get
    func getLaunches() {
        guard let realm = realm else {
            return
        }
        let allLaunches = realm.objects(Launch.self)
        launches = []
        
        for launch in allLaunches {
            launches.append(launch)
        }
    }
}
