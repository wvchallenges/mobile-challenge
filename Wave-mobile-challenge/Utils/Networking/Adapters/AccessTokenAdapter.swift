//
//  AuthorizationAdapter.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-10.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit
import Alamofire

class AccessTokenAdapter: RequestAdapter {

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        let accessToken = Config.shared.accessToken
        urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        return urlRequest
    }
}
