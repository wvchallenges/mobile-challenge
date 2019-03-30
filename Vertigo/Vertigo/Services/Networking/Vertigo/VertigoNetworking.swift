//
//  VertigoNetworking.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

class VertigoNetworking {

    private let networking: Networking
    private let accessTokenService: AccessTokenService
    
    init(networking: Networking, accessTokenService: AccessTokenService) {
        self.networking = networking
        self.accessTokenService = accessTokenService
    }
    
    func request<T: NetworkRequest>(_ request: T, completion: @escaping (NetworkResponse<T.ResponseType>) -> Void) {
        request.endpoint.headers["Authorization"] = "Bearer \(accessTokenService.accessToken)"
        networking.request(request, completion: completion)
    }
}
