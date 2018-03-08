//
//  APIClient.swift
//  WaveAssignment
//
//  Created by Fayyazuddin Syed on 2018-03-07.
//  Copyright © 2018 Fayyazuddin Syed. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper //third party library I'm using to store the token inside the Keychain

enum APIResult<T> {
    case error(Error)
    case success([T])
    case unexpectedResponse
}

struct APIClient {
    
    static let configuration = URLSessionConfiguration.default
    static var session: URLSession = {
        return URLSession(configuration: configuration)
    }()
    
    private static let urlString = "https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/"
    private static let token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    private static let accessToken = "accessToken"
    private static let bearer = "Bearer"
    private static let authorization = "Authorization"
    
    static func fetchProducts(completion: @escaping (APIResult<Product>) -> Void) {
        //I'm storing the value of the token inside the Keychain using a wrapper
        let _: Bool = KeychainWrapper.standard.set(token, forKey: accessToken)
        guard let retrievedToken = KeychainWrapper.standard.string(forKey: accessToken) else { return }
        guard let requestURL = URL(string: urlString) else { return }
        var request = URLRequest(url: requestURL)
        request.setValue("\(bearer) \(retrievedToken)", forHTTPHeaderField: authorization)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let e = error {
                DispatchQueue.main.async {
                    completion(.error(e))
                }
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    //this is to parse the date from the JSON data into the right format
                    decoder.dateDecodingStrategy = .iso8601
                    let products = try decoder.decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(products))
                    }
                } catch let jsonError {
                    print("Error serializing json:", jsonError)
                }
                
            } else {
                if let data = data {
                    let responseString = String(data: data, encoding: String.Encoding.utf8)
                    print("Unexpected response received: \(String(describing: responseString))")
                }
                
                DispatchQueue.main.async { completion(.unexpectedResponse) }
            }
        }
        task.resume()
    }
    
}
