//
//  ListViewController.swift
//  WaveDevTest
//
//  Created by Nisal Perera on 2016-04-04.
//  Copyright © 2016 Nisal Perera. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListViewController: UITableViewController {
    
    var products = Array<Product>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getProducts()
    }
    
    // This function returns immediately: The request happens on a background thread
    func getProducts(){
    
        let business_id = "89746d57-c25f-4cec-9c63-34d7780b044b"
        let access_token = "9IL9uJe3KIlWjGKhvHk731ARQaCVK6"
        
        Alamofire.request(.GET, "https://api.waveapps.com/businesses/\(business_id)/products/?access_token=\(access_token)").response {
            (request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?, error: NSError?) -> Void in
            if let data = data {
                // Interpret data (which is NSData) as a JSON object
                let json = JSON(data: data)
                
                print(json)
                
                if let items = json.array {
                    for item in items {
                        let tempProduct = Product(name: item["name"].string!,price: item["price"].int!)
                        self.products.append(tempProduct)
                    }
                }
                
                // Make sure we refresh the table view on the main thread
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductViewCell", forIndexPath: indexPath) as! TableViewCell

        // Configure the cell...
        cell.product = products[indexPath.row]
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
