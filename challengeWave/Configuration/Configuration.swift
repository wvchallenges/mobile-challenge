//
//  Configuration.swift
//  challengeWave
//
//  Created by Leandro Falbo Barros on 2021-10-20.
//

import Foundation
struct API {
    
    static let BaseURL = URL(string: "https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b")!
    
    static var AuthenticatedBaseURL: URL {
        return BaseURL
    }
    
}
