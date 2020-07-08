//
//  ProductTest.swift
//  WaveChallenge-UITableViewClassicTests
//
//  Created by John De Guzman on 2020-07-08.
//  Copyright © 2020 John De Guzman. All rights reserved.
//

import XCTest
@testable import WaveChallenge_UITableViewClassic

class ProductTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductVariables() throws {
          let product = Product(id: 123, price: 29.00, name: "testProduct")
          
          XCTAssertEqual(product.id, 123, "product Id should be equal to the string given in init")
          XCTAssertEqual(product.price, 29.00, "product price should be equal to the string given in init")
          XCTAssertEqual(product.name, "testProduct", "product name should be equal to the string given in init")
      }
      
      func testProductWithDecodable() throws {
          let json = """

          {
              "id": 231,
              "price": 20.00,
              "name": "Test Product",
          }
          """
          
          if let jsonData = json.data(using: .utf8) {
              let product = try! JSONDecoder().decode(Product.self, from: jsonData)
              XCTAssertEqual(product.id, 231, "The uuid inputted should be equal to the given json")
              XCTAssertEqual(product.name, "Test Product", "The name inputted should be equal to the given json")
              XCTAssertEqual(product.price, 20.00, "The phone number inputted should be equal to the given json")
              
          } else {
              XCTFail("This data didn't properly decode")
          }
          
      }
}
