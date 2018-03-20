//
//  ViewController.swift
//  WaveChallenge
//
//  Created by Akash Patel on 2018-02-27.
//  Copyright © 2018 Akash Patel. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
   private struct Constants {
        static let businessID = "89746d57-c25f-4cec-9c63-34d7780b044b"
    }
    
    @IBOutlet weak var productTableView: UITableView!
    var productsArray : [ProductDetails]!

    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNetworkAdatptor.fetchProductList(businessID: Constants.businessID, success: {
            products in
            self.productsArray = products
            self.productTableView.dataSource = self
            self.productTableView.delegate = self
            DispatchQueue.main.async() {
                self.productTableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ProductViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? UITableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = productsArray[indexPath.row].name
        cell.detailTextLabel?.text = "$\(productsArray[indexPath.row].price)"
        return cell
    }
    
}

