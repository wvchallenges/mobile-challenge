//
//  Product.swift
//  WaveDemoApp
//
//  Created by Doug Boutillier on 2021-03-13.
//

import Foundation

class Product : Equatable {
    
    
    var productID : NSInteger
    var productName : String
    var price : Double
    
    init (productDictionary : Dictionary<String , Any>) {
//        ["date_modified", "date_created", "description", "is_sold", "default_sales_taxes", "active", "is_bought", "id", "price", "expense_account", "income_account", "name", "url"
        
        productID = productDictionary["id"] as? NSInteger ?? 0
        productName = productDictionary["name"] as? String ?? ""
        price = productDictionary["price"] as? Double ?? 0.0
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.productID == rhs.productID
    }
    
    func formattedPriceString () -> String {
        return String(format: "$%.02f", price)
    }
    
    func isValidProduct () -> Bool {
        if productID == 0 {
            return false
        }
        
        if productName.count == 0 {
            return false
        }
        
        return true
    }
}
