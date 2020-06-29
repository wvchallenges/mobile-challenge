//
//  ProductsAPI+Mocking.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Moya
@testable import Listings

enum FetchScenario {
    case never
    case success
    case malformed
    case networkFailure
}

extension ProductsAPI {
    static func provideStub(for scenario: FetchScenario) -> MoyaProvider<ProductsAPI> {
        return MoyaProvider(
            endpointClosure: { target in
                return Endpoint(
                    url: target.baseURL.absoluteString,
                    sampleResponseClosure: {
                        switch scenario {
                        case .never: return .networkResponse(1, Data())
                        case .success: return .networkResponse(200, target.sampleData)
                        case .malformed: return .networkResponse(200, Data())
                        case .networkFailure: return .networkResponse(500, target.sampleData)
                        }
                    },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers
                )
            },
            stubClosure: { _ in (scenario == .never) ? .never : .immediate}
        )
    }
}
