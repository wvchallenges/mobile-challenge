//
//  ProductsViewModel.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import BoltsSwift

/**
	A delegate of this protocol will be aware of all
	data changes in the ProductsViewModel
*/
protocol ProductsViewModelDelegate: class {
	func viewModelLoaded(newData: [Product])
}


/**
	ProductViewModel is responsible for all data logic
	behind ProductsViewController.
*/
class ProductsViewModel {

	/// List of products comes for this hardcoded Business object
	var business: Business = Business(withBusinessId: Config.WaveBusinessId)

	var products: [Product]? = nil

	/// Usually only a corresponding view controller 
	/// is a delegate for this view model
	weak var delegate: ProductsViewModelDelegate?

	init() {

	}

	/**
		Performs an API request to load products for the business object
		stored in this view model. On success will notify delegate through
		viewModelLoaded(newData) method.
		- returns: Task object that can be used for asyncronous delayed actions
	*/
	func reloadData() -> Task<AnyObject?> {

		return business.requestProducts().continueOnSuccessWith {
			[weak self] requestedProducts in

			self?.products = requestedProducts
			self?.delegate?.viewModelLoaded(newData: requestedProducts)
			return nil
		}
	}
}
