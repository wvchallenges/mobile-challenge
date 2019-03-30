//
//  Endpoint.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import Foundation

enum HTTPMethod : String {
    case get
    case post
    case put
    case delete
    case patch
}

class Endpoint {
    
    let baseURL: String
    let method: HTTPMethod
    var headers: [String : String]
    let path: [String]
    let query: [String : String]
    
    init(baseURL: String, method: HTTPMethod, headers: [String : String] = [:], path: [String], query: [String : String] = [:]) {
        self.baseURL = baseURL
        self.method = method
        self.headers = headers
        self.path = path
        self.query = query
    }
}
