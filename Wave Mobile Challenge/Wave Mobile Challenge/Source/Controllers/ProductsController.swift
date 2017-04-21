//
//  ProductsController.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import UIKit

/**
* Products controller is responsible for displaying a list
* of products fetched from Wave api
*/
class ProductsController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var labelBackgroundMessage: UILabel!

	let viewModel = ProductsViewModel()

	fileprivate var refreshControl: UIRefreshControl = UIRefreshControl()
	fileprivate var cellIdentifier: String = String(describing: ProductTableCell.self)

	override func viewDidLoad() {
		super.viewDidLoad()

		viewModel.delegate = self

		configureTableView()
		refreshViewModelData()
	}

	/// Configures table view with custom cell and other parameters
	private func configureTableView() {

		let cellNib = UINib(nibName: cellIdentifier, bundle: nil)

		refreshControl.addTarget(self, action: #selector(refreshViewModelData), for: .valueChanged)
		refreshControl.tintColor = .white

		tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
		tableView.refreshControl = refreshControl
	}

	func refreshViewModelData() {

		refreshControl.beginRefreshing()

		viewModel.reloadData().continueWith { [weak self] task in

			self?.refreshControl.endRefreshing()
			if let error = task.error {
				self?.present(error: error)
				self?.labelBackgroundMessage.text = "Error loading products."
				return
			}
		}
	}
}


// MARK: UITableViewDelegate, UITableViewDataSource
extension ProductsController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let products = viewModel.products {

			labelBackgroundMessage.text = products.count == 0 ? "No products." : ""
			return products.count
		}

		labelBackgroundMessage.text = "Loading products..."

		return 0
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return ProductTableCell.Height
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProductTableCell

		let product = viewModel.products?[indexPath.row]
		cell.update(withProduct: product)

		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: ProductsViewModelDelegate
extension ProductsController: ProductsViewModelDelegate {

	func viewModelLoaded(newData: [Product]) {

		tableView.reloadData()
	}
}
