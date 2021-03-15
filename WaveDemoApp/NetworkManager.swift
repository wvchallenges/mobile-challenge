//
//  NetworkManager.swift
//  WaveDemoApp
//
//  Created by Doug Boutillier on 2021-03-11.
//

import Foundation

protocol NetworkDelegate {
    func didLoadFeed(feed : [Product]);
    func didFailToLoadFeed();
}


class NetworkManager {
    
    static func loadFeed (delegate : NetworkDelegate) {
        let urlString = "https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/"
        
        let url = URL(string: urlString)
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization" : "Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"]
        let urlSession = URLSession(configuration: config).dataTask(with: url!) { (data, response, error) in
            if error != nil {
                delegate.didFailToLoadFeed()
                return;
            }
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {

                        let parsedFeed = parseFeed(feed: json)
                        delegate.didLoadFeed(feed: parsedFeed)
                        
                    } else {
                        delegate.didFailToLoadFeed()
                    }
                } catch {
                    delegate.didFailToLoadFeed()
                }

            } else {
                delegate.didFailToLoadFeed()
            }
        }
                
        urlSession.resume()
    }
    
    static func parseFeed(feed:[[String : Any]]) -> [Product] {
        var productAccumulator = Array<Product>();
        for productDictionary in feed {
            let product = Product(productDictionary: productDictionary);
            productAccumulator.append(product);
        }
        return productAccumulator;
    }
}
