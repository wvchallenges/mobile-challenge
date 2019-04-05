//
//  ProductCellViewModel.swift
//  Vertigo
//
//  Created by Bushra Shahid on 4/5/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import Foundation

class ProductCellViewModel {
    let name: String
    let price: String
    
    init(product: Product) {
        self.name = product.name
        self.price = "$\(product.price)"
    }
}
