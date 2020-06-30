//
//  Product.swift
//  WaveChallenge-SwiftUI
//
//  Created by John De Guzman on 2020-06-29.
//

import Foundation

enum Section {
    case main
}

struct Product: Codable, Identifiable, Hashable {
    var id: Int
    var price: Double
    var name: String
}




