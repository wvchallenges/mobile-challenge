//
//  WaveSessionManager.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import Alamofire
import BoltsSwift

/**
	APIClient is a singleton manager class that 
	provides convenience methods for performing API requests.

	Internally it holds a SessionManager object configured
	to authorize each single API request that is aimed for 
	Wave API url.

	Also performs error idenfification and handling.
*/
class APIClient {
	static let shared = APIClient()

	private let sessionManager = SessionManager()

	init() {

		sessionManager.adapter = AccessTokenAdapter(accessToken: Config.WaveAccessToken)
	}

	/**
		Perform an API request and converts its response to provided Data Container type
		or generates error in case request fails.
		- parameters:
			- apiResource: An instance of URLRequestConvertibleWithResponse
		- returns: Task object with an APIResponse object or error
	*/
	func request(apiResource: URLRequestConvertibleWithResponse) -> Task<APIResponse> {

		let promise = TaskCompletionSource<APIResponse>()

		do {
			let urlRequest = try apiResource.asURLRequest()


			let request = sessionManager.request(urlRequest)
				.validate { request, response, data in
					
					if case 200 ..< 300 = response.statusCode {
						return .success
					}
					return .failure(WaveAppError.apiRequestFailed)
				}
				.responseJSON { response in

					switch response.result {
					case .success(let value):

						if let processedResponse = apiResource.process(response: value) {
							promise.set(result: processedResponse)
						} else {
							promise.set(error: WaveAppError.unexpectedAPIResponse)
						}
					case .failure(let error):
						promise.set(error: error)
					}

					APIClient.log(jsonResponse: response)
			}

			debugPrint(request)
		} catch {
			assertionFailure("Error creating url request")
		}

		return promise.task
	}

	/** 
		Logs json api response to a console
	*/
	private static func log(jsonResponse: DataResponse<Any>) {

		if let data = jsonResponse.data, let utf8Text = String(data: data, encoding: .utf8) {
			debugPrint("\n\(utf8Text)\n")
		}
	}
}

/**
	Adds Authorization header for each request to Wave API.
*/
class AccessTokenAdapter: RequestAdapter {
	private let accessToken: String

	init(accessToken: String) {
		self.accessToken = accessToken
	}

	func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
		var urlRequest = urlRequest

		if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(Config.WaveBaseUrl) {
			urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
		}

		return urlRequest
	}
}
