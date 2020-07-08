//
//  testStringExtension.swift
//  WaveChallenge-SwiftUITests
//
//  Created by John De Guzman on 2020-07-07.
//

import XCTest
@testable import WaveChallenge_SwiftUI

class testStringExtension: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let url = [NetworkingConstants.baseAPI, "products", "12345", "add"]
        
        XCTAssertEqual(url.createURL, "https://api.waveapps.com/products/12345/add/", "The create url extension should create a URL from an array of strings")
    }

}
