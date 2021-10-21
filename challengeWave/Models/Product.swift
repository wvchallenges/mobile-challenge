//
//  Product.swift
//  challengeWave
//
//  Created by Leandro Falbo Barros on 2021-10-20.
//

import Foundation
struct ProductElement: Codable {
    let id: Int
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id, name, price
    }
}

typealias Product = [ProductElement]
