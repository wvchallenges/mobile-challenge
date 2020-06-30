//
//  Product.swift
//  WaveChallenge-SwiftUI
//
//  Created by John De Guzman on 2020-06-29.
//

import Foundation

struct Product: Codable, Identifiable {
    var id: Int
    var price: Double
    var name: String
}


class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    let productService = ProductService()
    
    init(products: [Product] = []) {
        callProducts()
    }
    
    func callProducts() {
        productService.getProducts(businessId: NetworkingConstants.businessId) { [weak self] product, error in
            
            if let product = product {
                self?.products = product
                print(product)
            }
        }
    }
}



