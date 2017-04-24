//
//  ViewController.swift
//  WaveAssignment
//
//  Created by Fayyazuddin Syed on 2017-04-23.
//  Copyright © 2017 Fayyazuddin Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var productArray = [Product]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchProducts()
    }
    
    func fetchProducts() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let apiClient  = APIClient()
        apiClient.fetchProducts { result in
            
            switch result {
            case .error(let e):
                self.showAlert(title: "Error", message: e.localizedDescription)
            case .unexpectedResponse:
                self.showAlert(title: "Invalid Response", message: "The server returned an invalid response")
            case .success(let products):
                self.productArray = products
                self.productArray.sort(by: {$0.name < $1.name})
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        cell.textLabel?.text = productArray[indexPath.row].name
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let productPrice = formatter.string(from: productArray[indexPath.row].price as NSNumber) {
            cell.detailTextLabel?.text = "\(productPrice)"
        }
        
        return cell
        
    }
}

