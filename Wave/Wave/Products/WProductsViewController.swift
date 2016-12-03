//
//  WProductsViewController.swift
//  Wave
//
//  Created by cc on 16/11/30.
//  Copyright © 2016年 Wave. All rights reserved.
//

import UIKit
import SwiftyJSON

fileprivate let CellIdentifier = "WProductTableViewCell"

class WProductsViewController: UITableViewController {
    var business_id: String = "89746d57-c25f-4cec-9c63-34d7780b044b"
    var products: Array<WProductModel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let inset = UIEdgeInsetsMake(20, 0, 0, 0)
        self.tableView.contentInset = inset
        self.getProducts(business_id: self.business_id)
    }
}

//MARK: - Data process
private extension WProductsViewController {
    func getProducts(business_id: String) {
        let apiManager: WAPIManager = WAPIManager.sharedInstance
        let requestParams = WProductsRequestParams(business_id: business_id)
        apiManager.getProducts(requsetParams: requestParams) {
             [weak self] response in
            if (self != nil) {
                self!.products += response
                self!.tableView.reloadData()
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension WProductsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        if nil == cell {
            cell = UITableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: CellIdentifier)
        }
        cell?.textLabel?.text = products[indexPath.row].name
        let priceString = NSNumber.init(value: products[indexPath.row].price).dollarString()
        cell?.detailTextLabel?.text = priceString
        return cell!
    }
}



