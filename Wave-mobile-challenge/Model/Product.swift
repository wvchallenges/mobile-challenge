//
//  Product.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-08.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit
import Mantle

class Product: MTLModel, MTLJSONSerializing {

    var id: NSNumber?
    var url: String?
    var name: String?
    var price: NSNumber?
    var desc: String?

    static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        return [
            "id": "id",
            "url": "url",
            "name": "name",
            "price": "price",
            "desc": "description"
        ]
    }

    var formattedPrice: String {
        if let price = price {
            return Formatters.priceFormatter.string(from: price)!
        }
        return "--"
    }
}
