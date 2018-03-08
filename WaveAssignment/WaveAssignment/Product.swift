//
//  Product.swift
//  WaveAssignment
//
//  Created by Fayyazuddin Syed on 2018-03-07.
//  Copyright © 2018 Fayyazuddin Syed. All rights reserved.
//

import Foundation
import UIKit

struct Product: Decodable {
    
    let id: Int
    let url: String
    let name: String
    let price: Int
    let description: String
    let isSold: Bool
    let isBought: Bool
    let incomeAccount: IncomeAccount
    let expenseAccount: String?
    let isActive: Bool
    let dateCreated: Date
    let dateModified: Date
    let defaultSalesTaxes: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case price
        case description
        case isSold = "is_sold"
        case isBought = "is_bought"
        case incomeAccount = "income_account"
        case expenseAccount = "expense_account"
        case isActive = "active"
        case dateCreated = "date_created"
        case dateModified = "date_modified"
        case defaultSalesTaxes = "default_sales_taxes"
    }
}

struct IncomeAccount: Decodable {
    let id: Int
    let url: String
}
