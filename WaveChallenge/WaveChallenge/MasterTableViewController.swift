//
//  MasterTableViewController.swift
//  WaveChallenge
//
//  Created by Daniel on 11/14/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    let business_id = "89746d57-c25f-4cec-9c63-34d7780b044b"
    let authToken = "Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    var dataArray:[Product] = []
    
    struct Product {
        var name: String
        var price: String
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let urlPath = "https://api.waveapps.com/businesses/\(business_id)/products/"
        urlRequest(urlPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataArray[indexPath.row].name
        cell.detailTextLabel?.text = dataArray[indexPath.row].price

        return cell
    }
    

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
    
    func urlRequest (urlPath:String){
        let url = NSURL(string: urlPath)
        let request: NSURLRequest = NSURLRequest(URL:url!)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()

        //attach auth token
        config.HTTPAdditionalHeaders = ["Authorization" : authToken]
        let session = NSURLSession(configuration: config, delegate: nil , delegateQueue: nil)
    
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            //check status of http response
            if let httpResponse = response as? NSHTTPURLResponse {
                if(httpResponse.statusCode != 200){
                    print("error \(httpResponse.statusCode)")
                    
                    //print output
                    let output = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                    print(output)
                    
                    return
                }
            }
            
            //initialize JSON
            do {
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray{
                    
                    //print(jsonData)
                    self.extractJSON(jsonData)
                }
                
            }catch{
                print("Error converting data to JSON")
                
            }
            
        })
        task.resume()
    }

    func extractJSON (products:NSArray) {
        //extract name and price from JSON and store in dataArray
        for item in products{
            let obj = item as! NSDictionary
            let productName = obj.valueForKey("name") as! String
            let productPrice = obj.valueForKey("price") as! Double
            
            //format price into currency style
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            let price_string = formatter.stringFromNumber(productPrice)
            
            let product = Product(name:productName, price: price_string!)
            self.dataArray.append(product)
        }
        
        //reload tableview from UI thread
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
    }
}
