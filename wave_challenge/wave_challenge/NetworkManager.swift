//
//  NetworkManager.swift
//  wave_challenge
//
//  Created by Seul Lee on 2017-04-04.
//  Copyright © 2017 Tobok Lee. All rights reserved.
//

import Foundation

class NetworkManager {
    init() {}
    
    func getData(requestURL:String) {
        var request = URLRequest(url: URL(string: requestURL)!)
        request.httpMethod = "GET"
        request.setValue(Constants.waveBearerAccessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, error in
            if(error != nil){
                print("error")
            }else{
                let dataMapper = DataMapper()
                var items = [Product]()
                items = dataMapper.mapData(jsonData:data!)! as! [Product]
                self.fetchCompletionHandler(items: items)
            }
        }.resume()
    }
    
    func fetchCompletionHandler(items: [Product]) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.productFetchKey), object:items);
    }
}
