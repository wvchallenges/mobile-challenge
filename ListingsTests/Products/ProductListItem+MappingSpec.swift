//
//  ProductListItem+MappingSpec.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Listings

class ProductListItemMappingSpec: QuickSpec {
    override func spec() {
        describe("mapping from a `Product`") {
            it("should map name of product correctly") {
                var item = ProductListItem(
                    from: Product(id: 0, name: "apples", price: 1.0)
                )
                expect(item.name).to(equal("apples"))

                item = ProductListItem(
                    from: Product(id: 0, name: "oranges", price: 1.0)
                )
                expect(item.name).to(equal("oranges"))
            }
            it("should map price of product correctly") {
                var item = ProductListItem(
                    from: Product(id: 0, name: "bananas", price: 1.5),
                    in: Locale(identifier: "en_CA")
                )
                expect(item.price).to(equal("$1.50"))

                item = ProductListItem(
                    from: Product(id: 0, name: "pears", price: 2.99),
                    in: Locale(identifier: "en_CA")
                )
                expect(item.price).to(equal("$2.99"))

                item = ProductListItem(
                    from: Product(id: 0, name: "pears", price: 2.999),
                    in: Locale(identifier: "en_CA")
                )
                expect(item.price).to(equal("$3.00"))
            }
            it("should correctly take locale into account when formatting price") {
                var item = ProductListItem(
                    from: Product(id: 0, name: "yogurt", price: 0.001),
                    in: Locale(identifier: "en_GB")
                )
                expect(item.price).to(equal("£0.00"))

                item = ProductListItem(
                    from: Product(id: 0, name: "kefir", price: 9.995),
                    in: Locale(identifier: "en_GB")
                )
                expect(item.price).to(equal("£10.00"))

                item = ProductListItem(
                    from: Product(id: 0, name: "cream", price: -1.004),
                    in: Locale(identifier: "en_GB")
                )
                expect(item.price).to(equal("-£1.00"))
            }
        }
    }
}
