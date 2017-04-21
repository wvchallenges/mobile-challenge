//
//  DispatchQueue.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation


extension DispatchQueue {

	/**
		A convenience function to perform a delayed action
	*/
	func delay(_ timeInterval: TimeInterval, execute work: @escaping () -> Void) {

		asyncAfter(deadline: .now() + timeInterval, execute: work)
	}
}
