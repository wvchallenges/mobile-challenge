//
//  LandingController.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import UIKit

/**
	AppController is an initial view controller loaded by the app.
	It displays screen with project name and waits 2 seconds before
	loading ProductsController
*/
class AppController: UIViewController {

	/// Reference to activity indicator view in storyboard
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		activityIndicator.startAnimating()
		
		DispatchQueue.main.delay(2, execute: { [weak self] in
			self?.openProductsController()
		})
	}

	/*
		Initializes an instance of ProductsController from storyboard
		and pushes it on the navigation controller stack.
	*/
	private func openProductsController() {

		activityIndicator.stopAnimating()

		// Controller identifier is the same as the class name. 
		let controllerId = String(describing: ProductsController.self)

		guard let controller = storyboard?.instantiateViewController(withIdentifier: controllerId) else {
			assertionFailure("ProductsController wasn't initialized")
			return
		}

		navigationController?.pushViewController(controller, animated: true)
	}
}
