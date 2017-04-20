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

	let viewModel = ProductsViewModel()

	private var cellIdentifier: String = String(describing: ProductTableCell.self)

	override func viewDidLoad() {
		super.viewDidLoad()

		configureTableView()
	}

	/// Configures table view with custom cell and other parameters
	private func configureTableView() {

		let cellNib = UINib(nibName: cellIdentifier, bundle: nil)

		tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
	}
}


// MARK: UITableViewDelegate, UITableViewDataSource
extension ProductsController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
