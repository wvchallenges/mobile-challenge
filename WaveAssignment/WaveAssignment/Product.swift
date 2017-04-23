//
//  Product.swift
//  WaveAssignment
//
//  Created by Fayyazuddin Syed on 2017-04-23.
//  Copyright © 2017 Fayyazuddin Syed. All rights reserved.
//

import Foundation

struct Product {
    
    let id: Int
    let name: String
    let price: Int
    
    
    init(id:Int, name:String, price:Int) {
        self.id = id
        self.name = name
        self.price = price
    }
}
