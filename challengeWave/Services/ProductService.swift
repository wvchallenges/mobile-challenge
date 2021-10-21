//
//  DataManager.swift
//  challengeWave
//
//  Created by Leandro Falbo Barros on 2021-10-20.
//

import Foundation
import ObjectMapper

enum ProductError: Error {
    
    case unknown
    case failedRequest
    case invalidResponse
    
}

final class ProductService {
    
    typealias ProductDataCompletion = (Product?, ProductError?) -> ()
    
    // MARK: - Properties
    
    private let baseURL: URL
    
    // MARK: - Initialization
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    // MARK: - Requesting Data
    
    func waveData(completion: @escaping ProductDataCompletion) {
        
        let url = baseURL.appendingPathComponent("/products/")
        
        // FIXME: The correct thing would be to get this token from another API
        let token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                self.didFetchRedditData(data: data, response: response, error: error, completion: completion)
            }
        }.resume()
    }
    
    // MARK: - Helper Methods
    
    private func didFetchRedditData(data: Data?, response: URLResponse?, error: Error?, completion: ProductDataCompletion) {
        if let _ = error {
            completion(nil, .failedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                do {
                    let jsonDecoder = JSONDecoder()
                    let productData = try jsonDecoder.decode(Product.self, from: data)
                    completion(productData, nil)
                    
                } catch {
                    completion(nil, .invalidResponse)
                }
            } else {
                completion(nil, .failedRequest)
            }
        } else {
            completion(nil, .unknown)
        }
    }
    
}
