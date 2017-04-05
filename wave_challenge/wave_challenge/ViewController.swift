//
//  ViewController.swift
//  wave_challenge
//
//  Created by Seul Lee on 2017-04-04.
//  Copyright © 2017 Tobok Lee. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainTableView: UITableView!
    var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Listens for data loading.
        // Upon data loading completion, tableView will be reloaded from "loadData" function.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.loadData),
                                               name: NSNotification.Name(rawValue: Constants.productFetchKey),
                                               object: nil)
        
        // Get data by making "POST" request to Wave's public API.
        // API credentials are in Static.swift
        let networkManager = NetworkManager()
        networkManager.getData(requestURL: Constants.waveBusinessURL)
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self,
                                            name: NSNotification.Name(rawValue: Constants.productFetchKey),
                                            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(notification: Notification) {
        productList = notification.object as! [Product]!
        
        // Reloading TableView
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: This could change depending on "Active" implementation.
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell
        
        if cell == nil {
            tableView.register((UINib(nibName: "ProductTableViewCell", bundle: nil)), forCellReuseIdentifier: "ProductTableViewCell")
        }
        
        cell?.textLabel?.text = productList[indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Navigate to ProductDetailView
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        vc.product = productList[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
}

