//
//  ProductListViewModel.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import RxSwift

struct ProductListItem {
    let name: String
    let price: String

    init(from product: Product, in locale: Locale = Locale.current) {
        name = product.name
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        // TODO: SW – localization for 'unknown'
        price = numberFormatter.string(from: NSNumber(value: product.price)) ?? "unknown"
    }
}

final class ProductListViewModel {

    // MARK: - fields

    private let bag = DisposeBag()
    let items = BehaviorSubject<[ProductListItem]>(value: [])

    // MARK: - dependencies

    private let productDataService: ProductsDataServicing

    init(with productDataService: ProductsDataServicing) {
        self.productDataService = productDataService
    }

    // MARK: - actions

    func refresh() -> Single<Void> {
        let task = productDataService.fetchProducts()
        task.subscribe(onSuccess: { [unowned self] products in
                let items = products.map { ProductListItem(from: $0) }
                self.items.onNext(items)
            })
            .disposed(by: bag)
        return task.map { _ in () }
    }

}
