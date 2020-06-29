//
//  AppViewController.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-26.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit
import RxSwift

final class AppViewController: UIViewController {

    // MARK: - fields

    private let bag = DisposeBag()
    private var currentFlow: UIViewController?

    // MARK: - dependencies

    var appCoordinator: AppCoordinator!
    var productsUIFactory: ProductsUIFactory!

    // MARK: - lifcycle

    override func viewDidLoad() {
        super.viewDidLoad()
        beginRespondingToAppStateChanges()
    }

    // MARK: - state navigation

    func beginRespondingToAppStateChanges() {
        appCoordinator.appState.next { [unowned self] state in
            switch state {
            case .tour: break
            case .auth: break
            case .main: self.steerToMainFlow()
            }
        }
        .disposed(by: bag)
    }

    func steerToMainFlow() {
        log.info("steering app to product-list flow")
        let flow = productsUIFactory.makeProductsFlow()
        embed(flow, in: view, andRemove: currentFlow)
        currentFlow = flow
    }

}
