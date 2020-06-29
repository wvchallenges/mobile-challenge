//
//  Product+ParsingSpec.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-26.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Listings

class ProductParsingSpec: QuickSpec {
    override func spec() {
        it("should be decodable from json") {
            expect {
                _ = try BundleFileLoader.loadJsonFixture(
                    ProductFixtures.product,
                    andParseTo: Product.self
                )
            }.toNot(throwError())
        }
        it("should parse product fields correctly") {
            guard let product = try? BundleFileLoader.loadJsonFixture(ProductFixtures.product, andParseTo: Product.self) else {
                return
            }
            expect(product.id).to(equal(1))
            expect(product.name).to(equal("Bananas"))
            expect(product.price).to(equal(1.5))
        }
    }
}
