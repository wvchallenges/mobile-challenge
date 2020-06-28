//
//  ProductsUIFactory.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
// swiftlint:disable:next restricted_access_to_injector
import Swinject

enum ProductsStoryboards: String {
    case products = "Products"
}

final class ProductsUIFactory {

    private let resolver: Resolver

    init(with resolver: Resolver) {
        self.resolver = resolver
    }

    func makeProductsFlow() -> UINavigationController {
        let productListViewController = ProductListViewController.inflate(from: ProductsStoryboards.products)
        productListViewController.viewModel = resolver.resolve(ProductListViewModel.self)

        let navigationController = UINavigationController(rootViewController: productListViewController)
        return navigationController
    }

}
