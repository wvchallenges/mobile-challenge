//
//  testDoubleExtensions.swift
//  WaveChallenge-SwiftUITests
//
//  Created by John De Guzman on 2020-07-07.
//

import XCTest
@testable import WaveChallenge_SwiftUI
class testDoubleExtensions: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrice() throws {
        let price: Double = 29.99
        
        XCTAssertEqual(price.getPrice(), "$29.99", "The double should've turned into a prettified currency")
    }

}
