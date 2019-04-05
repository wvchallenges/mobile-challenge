//
//  AppContainer.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

let App = AppContainer()

class AppContainer {
    let networking = VertigoNetworking(networking: Networking(), accessTokenService: AccessTokenService())
}
