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
    
    func fetchProducts() {
        let request = ProductListRequest(businessId: "dd921fea-bef8-4281-a400-abefe265b601")
        networking.request(request) { (response) in
            switch response {
            case .success:
                print("success")
            case .failure:
                print("failure")
            }
        }
    }
}
