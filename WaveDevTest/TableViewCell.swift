//
//  TableViewCell.swift
//  WaveDevTest
//
//  Created by Nisal Perera on 2016-04-04.
//  Copyright © 2016 Nisal Perera. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var product: Product? {
        didSet {
            
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            
            nameLabel.text = product?.name
            priceLabel.text = formatter.stringFromNumber(product!.price!)
        }
    }

}
