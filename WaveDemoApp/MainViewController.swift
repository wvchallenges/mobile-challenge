//
//  ViewController.swift
//  WaveDemoApp
//
//  Created by Doug Boutillier on 2021-03-11.
//

import UIKit

class MainViewController: UIViewController, NetworkDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!;
    
    var products : [Product] = []

    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.loadFeed(delegate: self)
    }

    //MARK: - Network Delegate

    func didLoadFeed(feed: [Product]) {
        products.removeAll()
        
        for product in feed {
            if product.isValidProduct() {
                if !products.contains(product) {
                    products.append(product)
                }
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData();
        }
    }
    
    func didFailToLoadFeed() {
        print("failure")
        //TODO: handle error cases
    }
    
    // MARK: - Table methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        let product : Product = products[indexPath.row]
        cell.productNameLabel.text = product.productName + " (" + String(product.productID) + ")"
        cell.priceLabel.text = product.formattedPriceString()
        
        return cell;
    }

}

