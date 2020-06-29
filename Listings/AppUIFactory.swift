//
//  AppUIFactory.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit
// swiftlint:disable:next injector_import
import Swinject

enum AppStoryboards: String {
    case launchScreen = "LaunchScreen"
    case main = "Main"
}

final class AppUIFactory {

    private let resolver: Resolver

    init(with resolver: Resolver) {
        self.resolver = resolver
    }

    func makeAppFlow() -> UIViewController {
        let appFlow = AppViewController.inflate(from: AppStoryboards.main)
        appFlow.appCoordinator = resolver.resolve(AppCoordinator.self)
        appFlow.productsUIFactory = resolver.resolve(ProductsUIFactory.self)
        return appFlow
    }

}
