//
//  WProductModel.swift
//  Wave
//
//  Created by cc on 16/11/30.
//  Copyright © 2016年 Wave. All rights reserved.
//

import Foundation
import SwiftyJSON

class WProductModel {
    var name: String!
    var price: Double!
    
    class func fromJSON(product: JSON) -> WProductModel{
        let instance = WProductModel()
        instance.name = product["name"].stringValue
        instance.price = product["price"].doubleValue
        return instance
    }
}
