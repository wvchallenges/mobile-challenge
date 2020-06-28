//
//  ProductsAPI.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-26.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Moya

enum ProductsAPI {
    case products(businessId: String)
}

extension ProductsAPI: TargetType {
    var baseURL: URL {
        // swiftlint:disable:next force_unwrapping
        return URL(string: "https://api.waveapps.com")!
    }

    var path: String {
        switch self {
        case .products(let id): return "/businesses/\(id)/products/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .products: return .get
        }
    }

    var sampleData: Data {
        var data: Data?
        #if DEBUG
        var stringSample: String!
        switch self {
        case .products:
            stringSample =
            """
            [
            {
            "id": 11,
            "name": "Volumetric pipet #2",
            "price": 1.1
            },
            {
            "id": 13,
            "name": "Widgets",
            "price": 1.3
            }
            ]
            """
            data = stringSample.data(using: .utf8)
        }
        if data == nil {
            log.error("failed to serialize sample data for request \(self) – '\(stringSample ?? "")'")
        }
        #endif
        return data ?? Data()
    }

    var task: Task {
        switch self {
        case .products: return .requestPlain
        }
    }

    var headers: [String: String]? {
        return [
            "Content-type": "application/json"
        ]
    }
}
