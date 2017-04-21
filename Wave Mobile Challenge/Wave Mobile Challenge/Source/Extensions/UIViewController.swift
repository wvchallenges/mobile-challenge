//
//  UIViewController.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import UIKit

/**
 Convenience functions for some common actions for all UIViewControllers
 */
extension UIViewController {


	/**
	Presents a standard UIAlertController with Alert style popup
	which shows an error message. If error belongs to WaveAppError enum
	then it will display a custom message, otherwise will show "Unknown error."
	message.

	- parameters:
		- error: Error to display in alert pop up
	*/
	func present(error: Error) {

		var message = error.localizedDescription

		switch error {
		case WaveAppError.apiRequestFailed:
			message = "Failed to communicate with Wave services."
		case WaveAppError.unexpectedAPIResponse:
			message = "Failed to analyze Wave service response."
		default:
			message = "Unknown error."
		}

		let controller = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		controller.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		present(controller, animated: true, completion: nil)
	}
}
