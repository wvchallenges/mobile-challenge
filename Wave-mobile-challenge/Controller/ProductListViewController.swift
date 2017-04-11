//
//  ProductListViewController.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-08.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    fileprivate let productCellId = "ProductCellId"
    fileprivate var products: [Product]?

    @IBOutlet fileprivate weak var tableView: UITableView?
    private let productService = ProductService()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func loadProducts() {
        let businessId = Config.shared.defautlBusinessId
        productService.getProducts(forBusiness: businessId) { (products, error) in
            if let products = products {
                self.products = products
                self.tableView?.reloadData()
            } else if let error = error {
                let alert = UIAlertController(title: NSLocalizedString("Oops an error occured", comment: "Alert title for load products error"),
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: "Okay button title"), style: .default, handler: { (action) in

                }))
                self.show(alert, sender: self)
            }
        }
    }
}

extension ProductListViewController: UITableViewDelegate {

}

extension ProductListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath)

        if let product = self.products?[indexPath.row] {
            cell.textLabel?.text = product.name
            cell.detailTextLabel?.text = product.formattedPrice
        }
        return cell
    }
}
