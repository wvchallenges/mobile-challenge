//
//  ProductListService.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

class ProductListService {

    private let networking: VertigoNetworking
    
    init(networking: VertigoNetworking) {
        self.networking = networking
    }
    
    typealias RequestCompletion = ([Product]) -> Void
    
    func fetchProducts(completion: @escaping RequestCompletion) {
        let request = ProductListRequest(businessId: <#StringLiteral#>)
        networking.request(request) { (response) in
            switch response {
            case let .success(products):
                completion(products)
            case .failure:
                // This can be improved to communicate the error
                completion([])
            }
        }
    }
}
