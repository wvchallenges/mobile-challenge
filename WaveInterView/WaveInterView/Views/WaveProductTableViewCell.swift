//
//  WaveProductTableViewCell.swift
//  WaveInterView
//
//  Created by Zefeng Qiu on 2016-12-07.
//  Copyright © 2016 Zefeng Qiu. All rights reserved.
//

import UIKit

class WaveProductTableViewCell: UITableViewCell {
  
  private var waveProduct: WaveProduct?
  
  private let label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let subLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.accessoryType = .none
    self.selectionStyle = .none
    self.backgroundColor = UIColor.white
  }
  
  convenience init(waveProduct: WaveProduct) {
    self.init(style: UITableViewCellStyle.default, reuseIdentifier: WaveProductTableViewCell.identifier())
    
    self.waveProduct = waveProduct
    
    setupLabel()
  }
  
  /* UI Configuration */
  private func setupLabel() {
    self.contentView.addSubview(label)
    self.contentView.addSubview(subLabel)
    
    label.text = self.waveProduct?.name
    subLabel.text = self.waveProduct?.price
    
    NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: UIConstant.padding).isActive = true
    NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: subLabel, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1.0, constant: -UIConstant.padding).isActive = true
    NSLayoutConstraint(item: subLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension WaveProductTableViewCell: TableViewInfo {
  
  //return the identifier (string of cell class name) for the purpose of resuing
  static func identifier() -> String {
    return NSStringFromClass(WaveProductTableViewCell.self)
  }
  
  //return the customized row height of table view cell
  static func estimatedRowHeight() -> CGFloat {
    switch UIScreen.main.nativeBounds.height {
    case 1136:
      return UIConstant.screenHeight * 0.13
    case 1334:
      return UIConstant.screenHeight * 0.12
    default:
      return UIConstant.screenHeight * 0.1
    }
  }
  
  //register the cell in table view
  static func registerInTableView(tableView: UITableView) {
    tableView.register(WaveProductTableViewCell.self, forCellReuseIdentifier: identifier())
  }

  
}
