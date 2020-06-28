//
//  DependencyModule.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
// swiftlint:disable:next restricted_access_to_injector
import Swinject

extension DependencyRegistrar {
    internal var resolver: Resolver {
        return container
    }
}

final class DependencyRegistrar {
    fileprivate let container = Container(defaultObjectScope: .transient)

    init() {
        registerDependencies()
    }

    func registerDependencies() {
        // MARK: app level dependencies
        container.register(AppUIFactory.self) { AppUIFactory(with: $0) }
        container.register(AppCoordinator.self) { _ in AppCoordinator() }

        // MARK: products flow dependencies
        container.register(ProductsUIFactory.self) { ProductsUIFactory(with: $0) }
        container.register(ProductListViewModel.self) { _ in ProductListViewModel() }
    }
}
