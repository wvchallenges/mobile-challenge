//
//  ProductListRequest.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import Foundation

class ProductListRequest: NetworkRequest {
    
    typealias ResponseType = [Product]
    
    let businessId: String
    
    var endpoint: Endpoint {
        return Endpoint(baseURL: VertigoAPI.baseURL,
                        method: .get,
                        path: ["businesses", businessId, "products", ""])
    }
    
    var headers: [String : String] = [:]
    
    init(businessId: String) {
        self.businessId = businessId
    }
}
