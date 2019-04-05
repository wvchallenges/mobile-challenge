//
//  NetworkRequest.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import Foundation

protocol NetworkRequest {
    associatedtype ResponseType: Decodable
    var endpoint: Endpoint { get }
    var headers: [String : String] { get set }
}
