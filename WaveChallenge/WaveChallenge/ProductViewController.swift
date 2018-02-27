//
//  ViewController.swift
//  WaveChallenge
//
//  Created by Akash Patel on 2018-02-27.
//  Copyright © 2018 Akash Patel. All rights reserved.
//

import UIKit
import Alamofire

class ProductViewController: UIViewController {
    
    struct Constants {
        static let baseURL = "https://api.waveapps.com/businesses/"
        static let businessID = "89746d57-c25f-4cec-9c63-34d7780b044b"
        static let accessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
        
    }
    
    @IBOutlet weak var productTableView: UITableView!
    var productsArray : [ProductDetails]!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProductList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    This method is used for fetching data from the server
    func fetchProductList() {
        let productURL = URL(string: Constants.baseURL.appending(Constants.businessID).appending("/products/"))
        let header = ["Authorization": "Bearer " + Constants.accessToken]
        
        Alamofire.request(productURL!, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: header).validate().responseString(completionHandler: { response in
            guard let responceObject = response.result.value else {
                return
            }
            self.mapProductData(responce: responceObject)
        })
    }
    
//    This method used for parse JSON data in to array of ProductDetails
    func mapProductData (responce: String) {
        
        let decoder = JSONDecoder()
        guard let data = responce.data(using: .utf8) else {
            return
        }
        
        guard let products:[ProductDetails] = try! decoder.decode([ProductDetails].self, from: data) else {
            return
        }
        self.productsArray = products
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        self.productTableView.reloadData()
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

