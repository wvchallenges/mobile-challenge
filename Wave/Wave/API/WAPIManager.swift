//
//  WAPIManager.swift
//  Wave
//
//  Created by cc on 16/11/30.
//  Copyright © 2016年 Wave. All rights reserved.
//

import Foundation

class WAPIManager {
    static let sharedInstance = WAPIManager()
    private init() {
    }
    
    private func failureHandler(_ errorMessage: String) {
        print(errorMessage)
    }
    
    func getProducts(requsetParams: WProductsRequestParams, handler: @escaping(_ response: Array<WProductModel>)->Void) {
        let apiProducts = WAPIProducts()
        apiProducts.getProducts(requestParams: requsetParams, successHandler: {
            response in
            handler(response)
        }, failureHandler: {
            errorMessage in
            self.failureHandler(errorMessage)
        })
    }
}
