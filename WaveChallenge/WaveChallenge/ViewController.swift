//
//  ViewController.swift
//  WaveChallenge
//
//  Created by Tao on 2016-03-09.
//  Copyright © 2016 tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var products: [WaveProduct]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let businessId = "89746d57-c25f-4cec-9c63-34d7780b044b"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WaveAPIManager.fetchProductList(businessId) { [unowned self] (products, error) -> Void in
            if error == nil {
                self.products = products
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    private let identifier = "Cell"
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        if let product = products?[indexPath.row] {
            cell.textLabel?.text = product.name
            cell.detailTextLabel?.text = product.price
        }
        
        return cell
    }

}

