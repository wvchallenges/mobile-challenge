//
//  File.swift
//  WaveDevTest
//
//  Created by Nisal Perera on 2016-04-04.
//  Copyright © 2016 Nisal Perera. All rights reserved.
//

import Foundation


class Product: NSObject {
    let name: String?
    var price: Int?
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
        super.init()
    }
}