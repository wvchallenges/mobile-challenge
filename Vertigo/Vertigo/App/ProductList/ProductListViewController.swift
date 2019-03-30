//
//  ProductListViewController.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    let viewModel = ProductListViewModel(service: ProductListService(networking: App.networking))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.stateChangeHandler = { [unowned self] state in
            switch state {
            case .initial:
                break
            case .loading:
                self.showLoading(true)
            case let .products(products):
                self.showLoading(false)
                self.update(products)
            }
        }
        viewModel.loadProducts()
    }
    
    func showLoading(_ show: Bool) {
        
    }

    func update(_ products: [Product]) {
        
    }

}

