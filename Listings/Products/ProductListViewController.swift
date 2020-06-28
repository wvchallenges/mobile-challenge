//
//  ProductListViewController.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit
import RxSwift

final class ProductListViewController: UIViewController {

    // MARK: - private fields

    let bag = DisposeBag()

    // MARK: - dependencies

    var viewModel: ProductListViewModel!

    // MARK: - lifcycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: SW – localization
        title = "Products"
    }

}
