//
//  NetworkingTypes.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import Foundation

enum NetworkResponse<T: Decodable> {
    case success(T)
    case failure(Error)
}
