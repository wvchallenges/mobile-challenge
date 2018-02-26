//
//  ProductService.swift
//  WaveChallenge
//
//  Created by Chris Ta on 2018-02-26.
//  Copyright © 2018 ChrisHuyTa. All rights reserved.
//

import Foundation
import Alamofire

private let business_id = "89746d57-c25f-4cec-9c63-34d7780b044b"
private let access_token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
private let productAPIUrl = "https://api.waveapps.com/businesses/"

struct ProductService {
    
    func fetchAllProducts(completion: @escaping (DataResponse<Any>) -> Void) {
        let url: URL = URL(string: productAPIUrl + business_id + "/products/")!
        let headers: HTTPHeaders = ["Authorization": "Bearer " + access_token]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: headers)
            .validate()
            .responseJSON { (response) in
                completion(response)
        }
        
    }
}
