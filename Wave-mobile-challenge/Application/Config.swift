//
//  Config.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-09.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit
import Alamofire

class Config: NSObject {
    fileprivate override init() {}

    static let shared: Config = Config()

    private var options: [String: Any]?
    private let configFileName = "config"

    private func getOptions() -> [String: Any] {
        if options == nil {
            let url = Bundle.main.url(forResource: configFileName, withExtension: "json")!
            let jsonData = try! Data(contentsOf: url)
            options = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
        }
        return options!
    }

    var baseApiUrl: URL {
        return try! (getOptions()["baseApiUrl"] as! String).asURL()
    }

    let accessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    let defautlBusinessId = "89746d57-c25f-4cec-9c63-34d7780b044b"
}
