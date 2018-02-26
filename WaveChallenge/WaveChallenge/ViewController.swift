//
//  ViewController.swift
//  WaveChallenge
//
//  Created by Chris Ta on 2018-02-25.
//  Copyright © 2018 ChrisHuyTa. All rights reserved.
//

import UIKit
import Alamofire

private let business_id = "89746d57-c25f-4cec-9c63-34d7780b044b"
private let access_token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
private let productAPIUrl = "https://api.waveapps.com/businesses/"

class ViewController: UIViewController {

    let productListView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    var products = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productListView.dataSource = self
        
        self.view.addSubview(productListView)
        setupProductListView()
        
        fetchProducts()
    }
    
    //fet
    func fetchProducts() {
        let url: URL = URL(string: productAPIUrl + business_id + "/products/")!
        let headers: HTTPHeaders = ["Authorization": "Bearer " + access_token]
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: headers)
            .validate()
            .responseJSON { (response) in
                if let json = response.result.value {
                    self.products = json as! [[String:Any]]
                    self.productListView.reloadData()
                }
                
        }
    }
    
    func setupProductListView() {
        productListView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        productListView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        productListView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        productListView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: "wave")
        var product = products[indexPath.row]
        cell.textLabel?.text = product["name"] as? String
        let price = formatCurrency(amount: product["price"] as! Float)
        cell.detailTextLabel?.text = "\(price)"
        cell.detailTextLabel?.textColor = UIColor.blue
        
        return cell
    }
    
    func formatCurrency(amount: Float) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = "CAD"
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
}

