//
//  BaseViewController.swift
//  WaveInterView
//
//  Created by Zefeng Qiu on 2016-12-07.
//  Copyright © 2016 Zefeng Qiu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  
  //MARK: Properties:
  
  lazy var tableView: UITableView = {
    let tv = UITableView(frame: (CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: UIConstant.screenWidth , height: UIConstant.screenHeight))), style: UITableViewStyle.plain)
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  
  
  //MARK: view life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "WAVE"
  }
  
  //MARK: Presenting Alert View when error happens 
  
  func presentAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    self.present(alert, animated: true, completion: nil)
  }
  
  
  //MARK: UI configuration functions:
  
  func setupTableView() {
    self.view.addSubview(tableView)
    Layout.itemWithSameLeftRightArroundInSuperView(item: tableView, toView: self.view, padding: 0)
    NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 60).isActive = true
    NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
