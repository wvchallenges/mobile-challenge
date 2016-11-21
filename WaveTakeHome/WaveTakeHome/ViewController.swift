//
//  ViewController.swift
//  WaveTakeHome
//
//  Created by Henry Savit on 11/20/16.
//  Copyright © 2016 HenrySavit. All rights reserved.
//

/* 
 1. Your app must retrieve the list of products for the specific business ID sent to you by your Wave contact
 2. The list of products should be fetched and shown to the user in a list view when the app is launched.
 3. Each item in the list view should show the product name and price (formatted as a dollar amount.)
*/

import UIKit
import Alamofire

struct FetchedData {
    let productName: String
    let price: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let access_token = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    let business_id = "89746d57-c25f-4cec-9c63-34d7780b044b"
    
    var tableData: [FetchedData] = []
    
    // MARK: UIViewController Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        Alamofire.request("https://api.waveapps.com/businesses/\(business_id)/products/?access_token=\(access_token)").response { response in

            if let data = response.data {
                let json = JSON(data: data)
                if json.count > 0 {
                    self.tableData = []
                    if let products = json.array {
                        for item in products {
                            let tempProduct = FetchedData(productName: item["name"].string ?? "No Product Name", price: item["price"].int ?? 0)
                            self.tableData.append(tempProduct)
                        }
                        
                        DispatchQueue.main.async() {
                            self.table.reloadData()
                        }
                    }
                }
            }
            else {
                let alert = UIAlertController(title: "Could not get any response from the server", message: "Error: \(response.error)", style = .Alert)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (self.table.dequeueReusableCell(withIdentifier: "waveCell") as? TableViewCell)!
        
        let data = tableData[indexPath.row] as FetchedData
        cell.prodoctLabel?.text = "Product: \(data.productName)"
        cell.descriptionLabel?.text = "Price: \(data.price)"
        
        return cell
    }
}
