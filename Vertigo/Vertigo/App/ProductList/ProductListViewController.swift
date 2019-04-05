//
//  ProductListViewController.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

class ProductListViewController: UITableViewController {

    // MARK:- Properties
    private var products: [Product] = []
    
    let viewModel = ProductListViewModel(service: ProductListService(networking: App.networking))
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Vertigo Storefront", comment: "Vertigo Storefront")
        refreshControl = UIRefreshControl()
        
        bind(viewModel)
    }
    
}

// MARK:- Data Management
private extension ProductListViewController {
    
    func bind(_ viewModel: ProductListViewModel) {
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
        show ? refreshControl?.beginRefreshing() : refreshControl?.endRefreshing()
    }

    func update(_ products: [Product]) {
        self.products = products
        tableView.reloadData()
    }

}

// MARK:- UITableViewDataSource
extension ProductListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellReuseId, for: indexPath) as! ProductCell
        let product = ProductCellViewModel(product: products[indexPath.row])
        cell.load(product)
        return cell
    }
    
}

