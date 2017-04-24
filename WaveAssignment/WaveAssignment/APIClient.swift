//
//  APIClient.swift
//  WaveAssignment
//
//  Created by Fayyazuddin Syed on 2017-04-23.
//  Copyright © 2017 Fayyazuddin Syed. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case error(Error)
    case success([T])
    case unexpectedResponse
}

class APIClient {
    let configuration = URLSessionConfiguration.default
    lazy var session: URLSession = {
        return URLSession(configuration: self.configuration)
    }()
    
    func fetchProducts(completion: @escaping (APIResult<Product>) -> Void) {
        
        let urlString = "https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/"
        var request = URLRequest(url: URL(string: urlString)!)
        request.setValue("Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let e = error {
                DispatchQueue.main.async {
                    completion(.error(e))
                }
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]] {
                    //print(json)
                    var productArray = [Product]()
                    
                    for productDictionary in json! {
                        let product = Product(id: (productDictionary["id"] as? Int)!, name: (productDictionary["name"] as? String)!, price: (productDictionary["price"] as? Int)!)
                        
                        productArray.append(product)
                    }
                    
                    DispatchQueue.main.async {
                        completion(.success(productArray))
                    }
                    
                } else {
                    let responseString = String(data: data!, encoding: String.Encoding.utf8)
                    print("Unexpected response received: \(String(describing: responseString))")
                    DispatchQueue.main.async { completion(.unexpectedResponse) }
                }
            }
        }
        task.resume()
    }
    
}
