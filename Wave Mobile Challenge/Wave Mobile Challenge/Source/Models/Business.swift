//
//  Business.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import ObjectMapper
import BoltsSwift

/**
	Model class for Wave Business
*/
class Business: WaveObject {

	required init?(map: Map) {
		super.init(map: map)
	}

	init(withBusinessId businessId: String) {
		super.init()

		id = businessId
	}

	/**
		Performs an API request for business products (page 0).
		- returns: Task object that will hold an array of Products on success, error on failure
	*/
	func requestProducts() -> Task<[Product]> {

		let apiResource = BusinessRouter.listProducts(businessId: id, parameters: nil)

		return APIClient.shared.request(apiResource: apiResource).continueOnSuccessWith {
			apiResponse in

			if let productsResponse = apiResponse as? BusinessProductsResponse {
				return productsResponse.products
			}

			return [Product]()
		}
	}

}
