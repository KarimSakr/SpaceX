//
//  DetailViewModel.swift
//  SpaceX
//
//  Created by Karim Sakr on 31/10/2023.
//

import Foundation

class DetailViewModel {
    
    private let networkManager = NetworkManager.shared
    
    func fetchRocket(id: String, completion: @escaping (Rocket?, Error?) -> Void) {
        
        networkManager.fetchData(of: Rocket.self, id: id) { rocket, error in
            
            if let error = error {
                
                completion(nil, error)
                return
            } else {
                
                guard let rocket = rocket else {
                    return
                }
                completion(rocket, nil)
            }
        }
    }
}
