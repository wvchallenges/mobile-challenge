//
//  MockProductDataService.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import RxSwift
@testable import Listings

class MockProductDataService {

    // MARK: - fields for assertion

    var fetchProductsRequestedCount = 0

    // MARK: - init

    fileprivate var _products = BehaviorSubject<[Product]>(value: [])
    fileprivate let _publisher = PublishSubject<Event<[Product]>>()

    init() { }

    // MARK: - control functions

    func reset() {
        fetchProductsRequestedCount = 0
        _products.onNext([])
        _publisher.onNext(.next([]))
    }

    func completeFetch(with products: [Product]) {
        _publisher.onNext(.next(products))
    }

    func failFetch(with error: Error) {
        _publisher.onNext(.error(error))
    }

}

extension MockProductDataService: ProductsDataServicing {
    var products: BehaviorSubject<[Product]> {
        return _products
    }

    func fetchProducts() -> Single<[Product]> {
        fetchProductsRequestedCount += 1
        return _publisher
            .dematerialize()
            .take(1)
            .asSingle()
    }
}
