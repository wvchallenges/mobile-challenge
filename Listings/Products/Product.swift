//
//  Product.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-26.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation

struct Product: Codable, Equatable {
    let id: Int
    let name: String
    let price: Double
}
