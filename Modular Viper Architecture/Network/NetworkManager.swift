//
//  NetworkManager.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData(url: URL, completion: @escaping (Result<[University], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data was nil."])
                completion(.failure(error))
                return
            }
            do {
                let universities = try JSONDecoder().decode([University].self, from: data)
                completion(.success(universities))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
