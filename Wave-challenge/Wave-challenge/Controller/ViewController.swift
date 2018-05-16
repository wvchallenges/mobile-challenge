//
//  ViewController.swift
//  Wave-challenge
//
//  Created by Siddhesh Mahadeshwar on 16/05/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "tableViewCell"

class ViewController: UIViewController {

    var productArray = [Product](){
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getProducts(bussinessId: bussinessId) { result in
            switch result {
            case .Success(let productArray):
                self.productArray = productArray
            case .Failure(let error):
                self.showErrorAlert(message: error)
            }
        }
    }
}

// MARK: - Table View delegate, datasource methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productModel = productArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProductTableViewCell
        cell.titleLabel.text = productModel.name
        cell.priceLabel.text = productModel.priceFormatted
        return cell
    }
}
