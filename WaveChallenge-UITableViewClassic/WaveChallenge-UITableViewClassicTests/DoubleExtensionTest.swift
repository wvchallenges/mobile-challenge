//
//  DoubleExtensionTest.swift
//  WaveChallenge-UITableViewClassicTests
//
//  Created by John De Guzman on 2020-07-08.
//  Copyright © 2020 John De Guzman. All rights reserved.
//

import XCTest
@testable import WaveChallenge_UITableViewClassic

class testDoubleExtensions: XCTestCase {


    func testPrice() throws {
        let price: Double = 29.99
        XCTAssertEqual(price.getPrice(), "$29.99", "The double should've turned into a prettified currency")
    }

}
