//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Karim Sakr on 01/11/2023.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private init(){}
    
    func fetchData<T:Decodable>(of model: T.Type, id: String? = nil, completion: @escaping (T?, Error?) -> Void) {
        
        var endpoint: String {
            if id != nil || model == Rocket.self {
                return "rockets/\(id!)"
                
            } else {
                return "launches"
            }
        }
        
        AF.request(Constants.baseUrl + endpoint , encoding: URLEncoding.default).response { response in
            
            switch response.result {
                
            case .success(let fetchedData):
                do {
                    let data = try JSONDecoder().decode(model.self, from: fetchedData!)
                    completion(data, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
            
        }
    }
}
