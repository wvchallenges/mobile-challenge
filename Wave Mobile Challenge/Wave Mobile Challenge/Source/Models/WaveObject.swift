//
//  WaveObject.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation
import ObjectMapper

/**
	WaveObject is a base model class that holds
  all shared properties between wave model objects like Id.
*/
class WaveObject: Mappable {

	private struct Keys {
		static let Id = "id"
	}

	var id: String = ""

	init() {

	}
	
	required init?(map: Map) {

	}

	func mapping(map: Map) {

		id <- map[Keys.Id]
	}
}
