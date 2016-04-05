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
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
