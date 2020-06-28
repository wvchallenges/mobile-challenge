//
//  ProductItemCell.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit

class ProductItemCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    func populate(item: ProductListItem) {
        nameLabel.text = item.name
        priceLabel.text = item.price
    }
}
