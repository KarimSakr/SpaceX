//
//  NetworkManagerProtocol.swift
//  SpaceX
//
//  Created by Karim Sakr on 04/11/2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T:Decodable>(of model: T.Type, id: String? , completion: @escaping (T?, Error?) -> Void)
}
