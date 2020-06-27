//
//  ProductList+Parsing.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-26.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Listings

class ProductListParsingSpec: QuickSpec {
    override func spec() {
        it("should be decodable from json") {
            expect {
                _ = try BundleFileLoader.loadJsonFixture(
                    ProductFixtures.productList,
                    andParseTo: [Product].self
                )
            }.toNot(throwError())
        }
        it("should parse a list of products correctly") {
            guard let products = try? BundleFileLoader.loadJsonFixture(ProductFixtures.productList, andParseTo: [Product].self) else {
                return
            }
            expect(products.count).to(equal(11))
            expect(products.first?.id).to(equal(6102823))
            expect(products.last?.id).to(equal(6102822))
        }
    }
}
