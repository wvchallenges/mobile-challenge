//
//  NetworkManager.swift
//  WaveCodingChallengeApp
//
//  Created by Safan Maredia on 2018-06-05.
//  Copyright © 2018 Salman Maredia. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    
    static let businessID = "89746d57-c25f-4cec-9c63-34d7780b044b"
    static let headers: HTTPHeaders = [
        "Authorization": "bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm",
        "Accept": "application/json"
    ]
  
    static func getProducts(callback:@escaping ([[String:Any]])->()){
        
        Alamofire.request("https://api.waveapps.com/businesses/\(businessID)/products/", headers: headers).responseJSON { response in
            
            if let json = response.result.value as? [[String:Any]]{
                callback(json)
            }
            else{
                callback([])
            }
        }
    }
}
