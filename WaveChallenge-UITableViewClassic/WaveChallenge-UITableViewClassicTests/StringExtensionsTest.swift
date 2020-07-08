//
//  StringExtensionsTest.swift
//  WaveChallenge-UITableViewClassicTests
//
//  Created by John De Guzman on 2020-07-08.
//  Copyright © 2020 John De Guzman. All rights reserved.
//

import XCTest
@testable import WaveChallenge_UITableViewClassic

class StringExtensioonTest: XCTestCase {

    func testExample() throws {
        let url = [NetworkingConstants.baseAPI, "products", "12345", "add"]
        
        XCTAssertEqual(url.createURL, "https://api.waveapps.com/products/12345/add/", "The create url extension should create a URL from an array of strings")
    }

}
