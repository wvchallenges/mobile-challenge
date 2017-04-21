//
//  ProductTableCell.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import UIKit

// Product table cell is a view class that displays a single product
class ProductTableCell: UITableViewCell {

	static let Height: CGFloat = 90

	@IBOutlet weak var labelProductName: UILabel!
	@IBOutlet weak var labelProductPrice: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	/**
		Fills UI elements of this table cell with Product date
		- parameters:
			- product: Product object that will be used for filling this cell
	*/
	func update(withProduct product: Product?) {

		if let product = product {
			labelProductName.text = product.name
			labelProductPrice.text = String(format: "$%.2f", product.price)
		} else {
			labelProductName.text = ""
			labelProductPrice.text = ""
		}
	}
}
