//
//  WaveAPIManager.swift
//  WaveChallenge
//
//  Created by Tao on 2016-03-09.
//  Copyright © 2016 tao. All rights reserved.
//

import Foundation


class WaveAPIManager {
    struct WaveEndpoints {
        static let basicUrl = "https://api.waveapps.com/businesses"
        
        static let productList = "/%@/products"
    }
    
    static let accessToken = "QmGeSTFctQf06uWFMQAW1m7pJ4FUQ3"
    
    static func fullUrlWithPath(path: String) -> String {
        return String(format: "%@%@", WaveEndpoints.basicUrl, path)
    }
    
    static func fetchProductList(businessId: String, completion: ([WaveProduct]?, NSError?) -> Void) {
        let path = String(format: WaveEndpoints.productList, businessId)
        let queryString = ["access_token": accessToken]
        
        let requestManager = AFHTTPRequestOperationManager()
        
        let requestString = fullUrlWithPath(path)
        requestManager.GET(requestString, parameters: queryString, success: { (operation, response) -> Void in
            if let responseObject = response as? [[String:AnyObject]] {
                let products = responseObject.map({ (productInfo) -> WaveProduct in
                    return WaveProduct.productWithProductInfo(productInfo)
                })
                completion(products, nil)
            }
            
            }) { (operation, error) -> Void in
                print(error)
                completion(nil, error)
        }
    }
}