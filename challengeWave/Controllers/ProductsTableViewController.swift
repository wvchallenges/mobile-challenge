//
//  ProductsTableViewController.swift
//  challengeWave
//
//  Created by Leandro Falbo Barros on 2021-10-20.
//

import UIKit
import Network

class ProductsTableViewController: UITableViewController {
    
    // MARK: -
    
    private lazy var dataManager = {
        return ProductService(baseURL: API.AuthenticatedBaseURL)
    }()
    
    // MARK: -
    
    var viewModel: HomeViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                self.fetchWaveData()
            }
        }
        
        monitor.start(queue: queue)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfProducts
    }
    
    // MARK: - View Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        let name = viewModel?.products[indexPath.row].name
        let price = viewModel?.products[indexPath.row].price ?? 0
        
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = viewModel?.getPrice(value: price)
        
        return cell
    }
    
    
    // MARK: - Data Methods
    
    fileprivate func fetchWaveData() {
        dataManager.waveData() { (response, error) in
            if let error = error {
                print(error)
            } else if let response = response {
                self.viewModel = HomeViewModel(products: response)
            }
        }
    }
    
    private func updateView() {
        
        if let _ = viewModel {
            updateWaveData()
            
        }
    }
    
    private func updateWaveData() {
        self.tableView.reloadData()
    }
    
}
