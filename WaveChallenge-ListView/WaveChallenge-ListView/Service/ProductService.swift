//
//  ProductService.swift
//  WaveChallenge-SwiftUI
//
//  Created by John De Guzman on 2020-06-29.
//

import Foundation
import Alamofire


class ProductService {
    
    func getProducts(businessId: String, onComplete: @escaping ([Product]?, AFError?) -> () ) {
        let api = ([NetworkingConstants.baseAPI, NetworkingConstants.business, businessId, NetworkingConstants.products].createURL)
        let authHeader: HTTPHeaders = [
            "Authorization": "Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm",
            "Accept": "*/*",
        ]
       
        AF.request(api, headers: authHeader).responseDecodable{ (response: DataResponse<[Product], AFError>) in
            onComplete(response.value, response.error)
        }
    }
    
    
}
