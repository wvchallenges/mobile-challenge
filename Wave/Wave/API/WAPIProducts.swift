//
//  WAPIProducts.swift
//  Wave
//
//  Created by cc on 16/11/30.
//  Copyright © 2016年 Wave. All rights reserved.
//

import Foundation

class WProductsRequestParams {
    var business_id: String
    var active_only: Bool?
    var embed_accounts: Bool?
    var modified_after: Date?
    var modified_before: Date?
    
    init(business_id: String, active_only: Bool? = nil, embed_accounts: Bool? = nil, modified_after: Date? = nil, modified_before: Date? = nil) {
        self.business_id = business_id
        self.active_only = active_only
        self.embed_accounts = embed_accounts
        self.modified_after = modified_after
        self.modified_before = modified_before
    }
    
    func toDict()-> [String: Any]? {
        var params: [String: Any] = [:]
        if self.active_only != nil {
            params["active_only"] = self.active_only
        }
        if self.embed_accounts != nil {
            params["embed_accounts"] = self.embed_accounts
        }
        if self.modified_after != nil {
            params["modified_after"] = self.modified_after
        }
        if self.modified_before != nil {
            params["modified_before"] = self.modified_before
        }
        
        return params.count > 0 ? params : nil
    }
}

class WAPIProducts {
    private func getEndPoint(business_id: String) -> String{
        return "/businesses/\(business_id)/products/"
    }
    
    func getProducts(requestParams: WProductsRequestParams, successHandler: @escaping(_ response: [WProductModel])->Void, failureHandler: @escaping(_ errorMessage: String)->Void) {
        let endPoint = getEndPoint(business_id: requestParams.business_id)
        WNetworkEngine.get(endPoint: endPoint, requestParams: requestParams.toDict(), successHandler: {
            response in
            var products: [WProductModel] = []
            for index in 0..<response.count {
                let product = WProductModel.fromJSON(product: response[index])
                products.append(product)
            }
            successHandler(products)
        }, failureHandler: {
            errorMessage in
            failureHandler(errorMessage)
        })
    }
}
