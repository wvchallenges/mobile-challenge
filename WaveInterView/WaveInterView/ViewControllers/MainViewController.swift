//
//  MainViewController.swift
//  WaveInterView
//
//  Created by Zefeng Qiu on 2016-12-07.
//  Copyright © 2016 Zefeng Qiu. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    WaveClient.sharedInstance.getProductListBaseOnBusinessID(completionHandlerForGetList: { success, error in
      if success {
        GCD.performUIUpdatesOnMain({
          self.tableView.delegate = self
          self.tableView.dataSource = self
          self.setupTableView()
          WaveProductTableViewCell.registerInTableView(tableView: self.tableView)
        })
      }else {
        if let error = error {
          self.presentAlert(title: "Error", message: error)
        }
      }
    })
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

//MARK: UITableView DataSource
extension MainViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return WaveClient.sharedInstance.products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = WaveProductTableViewCell(waveProduct: WaveClient.sharedInstance.products[indexPath.row])
    return cell
  }
  
}


//MARKL: UITableView Delegate
extension MainViewController: UITableViewDelegate {
  

}

