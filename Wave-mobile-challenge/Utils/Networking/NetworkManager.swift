//
//  NetworkManager.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-10.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {

    static let sharedSession: SessionManager = {
        let configuration = URLSessionConfiguration.default
        let defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        var additionalHeaders = configuration.httpAdditionalHeaders ?? [AnyHashable: Any]()

        for (key, value) in defaultHeaders {
            additionalHeaders[key] = value
        }
        configuration.httpAdditionalHeaders = additionalHeaders
        let sessionManager = Alamofire.SessionManager(configuration: configuration)

        return sessionManager
    }()
}
