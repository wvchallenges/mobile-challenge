//
//  TableCell_InfoProtocol.swift
//
//
//  Created by Zefeng Qiu on 2015-11-16.
//
//

import UIKit


/**
 
 Protocol for Table View Cell set up and register
 
 */

protocol TableViewInfo {
  
  //return the identifier (string of cell class name) for the purpose of resuing
  static func identifier() -> String
  
  //return the customized row height of table view cell
  static func estimatedRowHeight() -> CGFloat
  
  //register the cell in table view
  static func registerInTableView(tableView: UITableView)
}
