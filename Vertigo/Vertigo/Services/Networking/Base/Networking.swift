//
//  Networking.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

class Networking {
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: NetworkRequest>(_ request: T, completion: @escaping (NetworkResponse<T.ResponseType>) -> Void) {
        guard let baseURL = URL(string: request.endpoint.baseURL) else {
            assertionFailure("Invalid base url")
            return
        }
        
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = request.endpoint.method.rawValue
        request.headers.forEach { urlRequest.addValue($1, forHTTPHeaderField: $0) }
        request.endpoint.path.forEach { urlRequest.url?.appendPathComponent($0) }
        
        task(urlRequest, completion: completion).resume()
    }
    
    private func task<T: Decodable>(_ request: URLRequest, completion: @escaping (NetworkResponse<T>) -> Void) -> URLSessionDataTask {
        return session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    completion(.success(try JSONDecoder().decode(T.self, from: data)))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(NetworkError.unknown))
            }
        }
    }
}
