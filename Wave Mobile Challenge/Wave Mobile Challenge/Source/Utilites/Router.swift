//
//  Router.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

/**
	Provides an extra required function which forces every API request
	to parse it's own response.
*/
protocol URLRequestConvertibleWithResponse: URLRequestConvertible {

	/**
		Attemps to process API request data to a corresponding data container.
	*/
	func process(response: Any?) -> APIResponse?
}

/**
	An enum that serves as a convenient router. Enum syntax forces to 
	completely configure each possible APIRequest before code can even be compiled.
*/
enum BusinessRouter: URLRequestConvertibleWithResponse {

	case listProducts(businessId: String, parameters: Parameters?)

	static let baseURLString: String = Config.WaveBaseUrl

	var method: HTTPMethod {
		switch self {
		case .listProducts:
			return .get
		}
	}

	var path: String {
		switch self {
		case .listProducts(let businessId, _):
			return "businesses/\(businessId)/products/"
		}
	}

	/**
		Converts this enum to an URLRequest that can be consumed
		by Alamofire session afterwards.
		- returns: URLRequest instance
	*/
	func asURLRequest() throws -> URLRequest {
		let url = try BusinessRouter.baseURLString.asURL()

		var urlRequest = URLRequest(url: url.appendingPathComponent(path))
		urlRequest.httpMethod = method.rawValue

		switch self {
		case .listProducts(_, let parameters):
			urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
		}

		return urlRequest
	}

	func process(response: Any?) -> APIResponse? {

		switch self {
		case .listProducts:
			return BusinessProductsResponse(withJSONObject: response)
		}
	}
}
