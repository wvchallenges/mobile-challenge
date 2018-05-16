//
//  Product.swift
//  Wave-challenge
//
//  Created by Siddhesh Mahadeshwar on 16/05/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Product {
    
    let id: Int
    let url: String?
    let name: String
    let price: Float
    let priceFormatted: String
    let description: String
    let isSold: Bool?
    let isBought: Bool?
    let incomeAccount: IncomeAccount?
    let expenseAccount: String?
    let isActive: Bool?
    let dateCreated: String?
    let dateModified: String?
   
    static func all(rawArray: [JSON]) -> [Product] {
        var products =  [Product]()
        for rawDictionary in rawArray {
            guard let dictionary = rawDictionary.dictionary, let id = dictionary["id"]?.int,
                let name = dictionary["name"]?.string,
                let price = dictionary["price"]?.float,
                let description = dictionary["description"]?.string else { continue }
            products.append(Product(id: id,
                                    url: dictionary["url"]?.string,
                                    name: name,
                                    price: price,
                                    priceFormatted: priceString(price),
                                    description: description,
                                    isSold: dictionary["is_sold"]?.bool,
                                    isBought: dictionary["is_bought"]?.bool,
                                    incomeAccount: dictionary["income_account"]?.dictionary.flatMap { IncomeAccount.get(rawDictionary: $0) } ?? nil, // flatMap will only pass non nil value
                                    expenseAccount: dictionary["expense_account"]?.string,
                                    isActive: dictionary["active"]?.bool,
                                    dateCreated: dictionary["date_created"]?.string,
                                    dateModified: dictionary["date_modified"]?.string))
        }
        return products
    }
}

struct IncomeAccount {
    let id: Int
    let url: String
    
    static func get(rawDictionary: [String: JSON]) -> IncomeAccount? {
        guard let id = rawDictionary["id"]?.int, let url = rawDictionary["url"]?.string else { return nil }
        return IncomeAccount(id: id, url: url)
    }
}
