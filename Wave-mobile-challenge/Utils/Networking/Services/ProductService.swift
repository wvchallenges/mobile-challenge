//
//  ProductService.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-09.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit
import Alamofire
import Mantle

class ProductService: BaseNetworkService {

    func getProducts(forBusiness businessId: String, params: Parameters = [:], completion handler: @escaping([Product]?, Error?) -> Void) {
        sessionManager.adapter = AccessTokenAdapter()
        sessionManager.request(ProductRouter.getProducts(businessId: businessId, params: params)).responseJSON { (response) in

            if let innerResponse = response.response {
                var products: [Product]? = nil
                var error: Error? = nil

                switch innerResponse.statusCode {
                case 200...299:
                    if let productArray = response.result.value as? [[String: Any]] {
                        products = try? MTLJSONAdapter.models(of: Product.self, fromJSONArray: productArray) as! [Product]
                    } else {
                        error = ServerError(errorObject: ["message": NSLocalizedString("Unable to process server response", comment: "")])
                    }
                    handler(products, error)
                default:
                    if let resultDict = response.result.value as? [String: Any],
                        let errorObj =  resultDict["error"] as? [String: Any] {
                        error = ServerError(errorObject: errorObj)
                    } else {
                        error = ServerError(errorObject: ["message": NSLocalizedString("An error occured.", comment: "")], code: innerResponse.statusCode)
                    }
                    handler(nil, error)
                }
            }
        }
    }
}
