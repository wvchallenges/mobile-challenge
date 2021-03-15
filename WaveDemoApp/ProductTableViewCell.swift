//
//  ProductTableViewCell.swift
//  WaveDemoApp
//
//  Created by Doug Boutillier on 2021-03-13.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!

    
    override func prepareForReuse() {
        self.productNameLabel.text = ""
        self.priceLabel.text = ""
    }

}
