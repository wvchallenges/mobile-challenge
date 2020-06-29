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

    // MARK: - fields

    private let bag = DisposeBag()
    private var items = [ProductListItem]()

    @IBOutlet private weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()

    // MARK: - dependencies

    var viewModel: ProductListViewModel!

    // MARK: - lifcycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Localized.string(ProductsCopy.productsListTitle)
        setupTableView()
        refreshControl.beginRefreshing()
        refreshList()
        beginTrackingItems()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshList), for: .valueChanged)
    }

    @objc private func refreshList() {
        log.info("pulled to refresh product list")
        viewModel.refresh().subscribe(
            onSuccess: { [unowned self] _ in
                self.refreshControl.endRefreshing()
            }, onError: { _ in
                self.refreshControl.endRefreshing()
            }).disposed(by: bag)
    }

    private func beginTrackingItems() {
        viewModel.items
            .next { [unowned self] items in
                self.items = items
                self.tableView.reloadData()
            }
            .disposed(by: bag)
    }

}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(reusable: ProductItemCell.self, for: indexPath)
        cell.populate(item: items[indexPath.item])
        return cell
    }
}
