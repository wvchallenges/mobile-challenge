//
//  DataModel.swift
//  wave_challenge
//
//  Created by Seul Lee on 2017-04-04.
//  Copyright © 2017 Tobok Lee. All rights reserved.
//

import Foundation

struct Product {
    var name: String!
    var id: Int!
    var description: String!
    var price: String!
    var active: Bool!
    
    init(name:String!, id: Int!, description: String!, price:Int!, active:Bool!) {
        self.name = name
        self.id = id
        self.description = description
        
        // Dollar format
        self.price = String(format:"$%.2f", Float(price))
        self.active = active
    }
}
