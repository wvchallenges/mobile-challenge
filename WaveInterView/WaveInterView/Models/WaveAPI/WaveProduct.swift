//
//  WaveProduct.swift
//  WaveInterView
//
//  Created by Zefeng Qiu on 2016-12-07.
//  Copyright © 2016 Zefeng Qiu. All rights reserved.
//

import Foundation


class WaveProduct {
  
  var id:Int!
  var name: String!
  var price: String!
  
  init(id: Int, name: String, price: Float) {
    self.id = id
    self.name = name
    self.price = price.asLocaleCurrency
  }
  
}

extension Float {
  
  var asLocaleCurrency:String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale.current
    return formatter.string(from: NSNumber(value: self))!
  }
  
}
