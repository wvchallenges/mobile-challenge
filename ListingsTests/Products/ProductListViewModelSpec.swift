//
//  ProductListViewModelSpec.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RxSwift
@testable import Listings

class ProductListViewModelSpec: QuickSpec {
    // swiftlint:disable:next function_body_length
    override func spec() {
        describe("displaying items") {
            var subject: ProductListViewModel!
            var mockProductDataService: MockProductDataService!
            var items: [ProductListItem]?
            var itemsError: Error?
            var testBag: DisposeBag!

            beforeEach {
                testBag = DisposeBag()
                mockProductDataService = MockProductDataService()
                subject = ProductListViewModel(
                    with: mockProductDataService,
                    localeProvider: Provider<Locale> { Locale.current }
                )

                subject.items
                    .subscribe(
                        onNext: { items = $0 },
                        onError: { itemsError = $0 }
                    )
                    .disposed(by: testBag)
            }
            afterEach {
                items = nil
                itemsError = nil
            }

            it("should should start with no items") {
                expect(items?.count).to(equal(0))
            }

            describe("on refresh") {
                var success: Bool?
                var refreshError: Error?

                beforeEach {
                    subject.refresh()
                        .subscribe(
                            onSuccess: { _ in success = true },
                            onError: { refreshError = $0 }
                        )
                        .disposed(by: testBag)
                }
                afterEach {
                    success = nil
                    refreshError = nil
                }

                it("should make a request to the data service for products") {
                    expect(mockProductDataService.fetchProductsRequestedCount).to(equal(1))
                }

                context("on success") {
                    beforeEach {
                        mockProductDataService.completeFetch(with: [
                            Product(id: 1, name: "bike", price: 150.0),
                            Product(id: 1, name: "car", price: 25000.0)
                        ])
                    }
                    it("should notify subscriber of success") {
                        expect(success).to(beTruthy())
                    }
                    it("should not error") {
                        expect(refreshError).to(beNil())
                    }
                    it("should update the items list") {
                        expect(items?.count).to(equal(2))
                    }
                }

                context("on failure") {
                    beforeEach {
                        mockProductDataService.failFetch(with: MockError.dummy)
                    }
                    it("should not notify subscriber of success") {
                        expect(success).to(beNil())
                    }
                    it("should notify subscriber of error") {
                        expect(refreshError).notTo(beNil())
                    }
                    it("should not update the items list") {
                        expect(items?.count).to(equal(0))
                    }
                    it("should not error out the items list stream") {
                        expect(itemsError).to(beNil())
                    }
                }
            }

            // TODO: SW – add disposal & stream tear-down tests here
        }
    }
}
