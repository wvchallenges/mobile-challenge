//
//  ProductRouter.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-09.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import Foundation
import Alamofire

enum ProductRouter: URLRequestConvertible {
    case getProducts(businessId: String, params: Parameters)

    var path: String {
        switch self {
        case .getProducts(let businessId, _):
            return "/businesses/\(businessId)/products/"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = Config.shared.baseApiUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)

        switch self {
        case .getProducts(_, let params):
            request = try URLEncoding.default.encode(request, with: params)
        }
        return request
    }

}
