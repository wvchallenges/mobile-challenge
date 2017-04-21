//
//  APIResponse.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import ObjectMapper

/**
	Base class for all API responses.
*/
class APIResponse: Mappable {

	init() {

	}

	required init?(map: Map) {
		debugPrint("test")
	}

	func mapping(map: Map) {
		debugPrint("test")
	}
}

/**
	Data container for Business Products API response.
	Holds an array of parsed products from JSON.
*/
class BusinessProductsResponse: APIResponse {

	var products: [Product] = []

	/**
		Optional failable initializer. Since Wave Business Products API is of 
		format: {[{}, {}]}, ObjectMapper can't handle it properly, 
		hence this initialzer is needed
	*/
	init?(withJSONObject jsonObject: Any?) {
		super.init()

		if let mappedProducts = Mapper<Product>().mapArray(JSONObject: jsonObject) {
			products = mappedProducts
			return
		}

		return nil
	}
	
	required init?(map: Map) {
		super.init(map: map)
	}

	override func mapping(map: Map) {

		if let test = Mapper<Product>().mapArray(JSONObject: map.JSON) {
			products = test
		}
	}
}
