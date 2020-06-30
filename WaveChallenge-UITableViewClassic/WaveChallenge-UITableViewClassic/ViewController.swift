//
//  ViewController.swift
//  WaveChallenge-UITableViewClassic
//
//  Created by John De Guzman on 2020-06-30.
//  Copyright © 2020 John De Guzman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
  
    var products = [Product]()
    
    let productService = ProductService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        callService()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func callService() {
        productService.getProducts(businessId: NetworkingConstants.businessId, onComplete: { [weak self] item, error in
            if let item = item {
                self?.products = item
                self?.tableView.reloadData()
            }
        })
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.listCellIdentifier) as? TitleSubtitleCell {
            cell.setup(title: products[indexPath.row].name, subtitle: products[indexPath.row].price.getPrice())
            return cell
        }
        
        fatalError()
    }
    
    
}

