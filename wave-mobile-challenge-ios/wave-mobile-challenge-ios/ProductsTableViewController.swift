//
//  ProductsTableViewController.swift
//  wave-mobile-challenge-ios
//
//  Created by Naweed Tajuddin on 2018-04-03.
//  Copyright © 2018 Naweed Tajuddin. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController
{

    var productsList = [Product]()
    let accessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    let productsEndpoint = "https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = "Billable Products"
        
        var urlRequest = URLRequest(url: URL(string: productsEndpoint)!)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            let decoder = JSONDecoder()
            do {
                self.productsList = try decoder.decode([Product].self, from: data!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("error parsing json data")
                print(error)
            }
        }
        
        task.resume()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)

        cell.textLabel?.text = productsList[indexPath.row].name
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let formattedAmount = formatter.string(from: productsList[indexPath.row].price as NSNumber) {
            cell.detailTextLabel?.text  = formattedAmount
        }

        return cell
    }


}
