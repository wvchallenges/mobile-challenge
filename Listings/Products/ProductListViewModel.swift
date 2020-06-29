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
        price = numberFormatter.string(from: NSNumber(value: product.price))
            ?? Localized.string(ProductsCopy.productItemUnknownPrice)
    }
}

final class ProductListViewModel {

    // MARK: - fields

    private let bag = DisposeBag()
    let items = BehaviorSubject<[ProductListItem]>(value: [])

    // MARK: - dependencies

    private let productDataService: ProductsDataServicing
    private let localeProvider: Provider<Locale>

    init(with productDataService: ProductsDataServicing,
         localeProvider: Provider<Locale>) {
        self.productDataService = productDataService
        self.localeProvider = localeProvider
    }

    // MARK: - actions

    func refresh() -> Single<Void> {
        let task = productDataService.fetchProducts()
        task.subscribe(onSuccess: { [unowned self] products in
                let items = products.map { product in
                    ProductListItem(
                        from: product,
                        in: self.localeProvider.provide()
                    )
                }
                self.items.onNext(items)
            })
            .disposed(by: bag)
        return task.map { _ in () }
    }

}
