//
//  Static.swift
//  wave_challenge
//
//  Created by Seul Lee on 2017-04-04.
//  Copyright © 2017 Tobok Lee. All rights reserved.
//

import Foundation

struct Constants {
    // Wave Specific
    static let waveAPIKey = "89746d57-c25f-4cec-9c63-34d7780b044b"
    static let waveAccessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    static let waveBusinessURL = String(format:"https://api.waveapps.com/businesses/%@/products/",waveAPIKey)
    static let waveBearerAccessToken = String(format:"Bearer %@", waveAccessToken)
    
    
    // Notification Key
    static let productFetchKey = "ProductFetched"
}
