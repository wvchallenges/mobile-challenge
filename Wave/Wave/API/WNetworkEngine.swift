//
//  WNetworkEngine.swift
//  Wave
//
//  Created by cc on 16/11/30.
//  Copyright © 2016年 Wave. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WNetworkEngine {
    static var baseURL: String!
    static var accessToken: String!
    
    class func config(baseURL: String, accessToken: String) {
        WNetworkEngine.baseURL = baseURL
        WNetworkEngine.accessToken = accessToken
    }
    
    class func get(endPoint: String, requestParams: [String: Any]?, successHandler: @escaping(_ response: JSON)->Void, failureHandler: @escaping(_ errorMessage: String)->Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + WNetworkEngine.accessToken
        ]
        
        Alamofire.request(WNetworkEngine.baseURL + endPoint, parameters: requestParams, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success(let value):
                if JSON(value)["error"] != JSON.null {
                    let errorMessage: JSON = JSON(value)["error"]
                    failureHandler(errorMessage["message"].stringValue)
                } else {
                    successHandler(JSON(value))
                }
            case .failure(let error):
                failureHandler(error.localizedDescription)
            }
        })
    }
}
