//
//  DataService+ProductsDataServicingSpec.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RxSwift
import Moya
@testable import Listings

class DataServiceProductsDataServicingSpec: QuickSpec {
    // swiftlint:disable:next function_body_length
    override func spec() {
        describe("fetching products") {
            var subject: DataService!
            var outcome: [Product]?
            var error: Error?
            var testBag: DisposeBag!

            beforeEach {
                testBag = DisposeBag()
            }
            afterEach {
                outcome = nil
                error = nil
            }

            it("should load in-memory cache initially with empty list of products") {
                subject = DataService(
                    businessId: "n/a",
                    productsAPI: ProductsAPI.provideStub(for: .never)
                )
                expect(subject.products.subscribeOnceNowValue).to(equal([]))
            }

            context("on success") {
                beforeEach {
                    subject = DataService(
                        businessId: "dummy-pass-along",
                        productsAPI: ProductsAPI.provideStub(for: .success)
                    )

                    subject.fetchProducts()
                        .subscribe(onSuccess: { outcome = $0 }, onError: {error = $0})
                        .disposed(by: testBag)
                }
                it("should notify subscribers with the fetched list of products") {
                    expect(outcome?.count).to(equal(2))
                    expect(outcome?.first?.name).to(equal("dummy-pass-along"))
                }
                it("should update the in-memory cache") {
                    expect(subject.products.subscribeOnceNowValue?.count).to(equal(2))
                    expect(subject.products.subscribeOnceNowValue?.first?.name).to(equal("dummy-pass-along"))
                }
                it("should not error") {
                    expect(error).to(beNil())
                }
            }

            context("on malformed data") {
                beforeEach {
                    subject = DataService(
                        businessId: "n/a",
                        productsAPI: ProductsAPI.provideStub(for: .malformed)
                    )

                    subject.fetchProducts()
                        .subscribe(onSuccess: { outcome = $0 }, onError: {error = $0})
                        .disposed(by: testBag)
                }
                it("should not notify subscribers with list of products") {
                    expect(outcome?.count).to(beNil())
                }
                it("should not error") {
                    expect(error).notTo(beNil())
                }
            }

            context("on network failure") {
                beforeEach {
                    subject = DataService(
                        businessId: "n/a",
                        productsAPI: ProductsAPI.provideStub(for: .networkFailure)
                    )

                    subject.fetchProducts()
                        .subscribe(onSuccess: { outcome = $0 }, onError: {error = $0})
                        .disposed(by: testBag)
                }
                it("should not notify subscribers with list of products") {
                    expect(outcome?.count).to(beNil())
                }
                it("should not error") {
                    expect(error).notTo(beNil())
                }
            }
        }
    }
}
