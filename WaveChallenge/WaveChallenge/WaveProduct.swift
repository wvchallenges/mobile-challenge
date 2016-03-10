//
//  WaveProduct.swift
//  WaveChallenge
//
//  Created by Tao on 2016-03-09.
//  Copyright © 2016 tao. All rights reserved.
//

import Foundation

class WaveProduct {
    static func productWithProductInfo(productInfo: [String: AnyObject]) -> WaveProduct {
        let waveProduct = WaveProduct()
        
        if let id = productInfo["id"] as? Int {
            waveProduct.identifier = id
        }
        
        if let name = productInfo["name"] as? String {
            waveProduct.name = name
        }
        
        if let price = productInfo["price"] as? NSNumber {
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = .CurrencyStyle
            numberFormatter.currencySymbol = "$"
            
            waveProduct.price = numberFormatter.stringFromNumber(price)
        }
        
        if let description = productInfo["description"] as? String {
            waveProduct.description = description
        }
        
        if let active = productInfo["active"] as? Bool {
            waveProduct.active = active
        }
        
        return waveProduct
    }
    
    var identifier: Int?
    var price: String?
    var name: String?
    var description: String?
    var active: Bool?
}