//
//  Netowrking.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-29.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Moya
import Alamofire

final class NetworkerFactory {
    static func make<T: TargetType>(for api: T.Type, with bearerToken: @escaping @autoclosure () -> String) -> MoyaProvider<T> {
        return MoyaProvider(
            endpointClosure: { target in
                let standardHeaders = [
                    // TODO: SW – global state access, think about if it would be better to pull this out via DI
                    HTTPHeader.authorization(bearerToken: bearerToken()),
                    HTTPHeader.defaultAcceptEncoding,
                    HTTPHeader.defaultAcceptLanguage,
                    HTTPHeader.defaultUserAgent
                    ]
                    .reduce(into: [String: String]()) { headers, header in
                        headers[header.name] = header.value
                }
                let headers = (target.headers ?? [:])
                    .merging(standardHeaders) { targetSpecified, _ in return targetSpecified }
                return Endpoint(
                    url: target.baseURL.absoluteString + target.path,
                    sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: headers
                )
            }
        )
    }
}

