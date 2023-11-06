//
//  HomeViewModel.swift
//  SpaceX
//
//  Created by Karim Sakr on 30/10/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    let networkManager = NetworkManager.shared
    var realmManager = RealmManager.shared
    
    @Published var allSuccessfullLaunches = [Launch]()
    
    func fetchLaunches() {
        allSuccessfullLaunches = realmManager.launches
        networkManager.fetchData(of: [Launch].self) { launches, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                
//                print("data fetched")
                guard let launches = launches else {
                    return
                }
                
                self.allSuccessfullLaunches = []
                for launch in launches {
                    
                    if launch.success && CGFloat(launch.dateUnix) > Date.now.timeIntervalSince1970 - 94608000 {
                        self.allSuccessfullLaunches.append(launch) // only successfulLaunches and less then 3 years
                        
                    }
                }
                self.realmManager.saveLaunches(of: self.allSuccessfullLaunches)
                
            }
        }
    }
}
