//
//  Product.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import ObjectMapper

/**
	Model class for Wave Product
*/
class Product: WaveObject {

	private struct Keys {
		static let Name = "name"
		static let Price = "price"
	}

	var name: String = ""
	var price: Double = 0

	required init?(map: Map) {
		super.init(map: map)
	}

	override func mapping(map: Map) {
		super.mapping(map: map)
		
		name <- map[Keys.Name]
		price <- map[Keys.Price]
	}
}
