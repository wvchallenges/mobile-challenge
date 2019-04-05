//
//  ProductCell.swift
//  Vertigo
//
//  Created by Bushra Shahid on 4/5/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    static let cellReuseId = "ProductCell"
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    func load(_ viewModel: ProductCellViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
    }
}
