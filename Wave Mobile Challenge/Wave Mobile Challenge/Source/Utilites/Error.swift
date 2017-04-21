//
//  Error.swift
//  Wave Mobile Challenge
//
//  Created by Artur Shinkevich on 2017-04-20.
//  Copyright © 2017 ashinkevich. All rights reserved.
//

import Foundation

/**
	Custom errors for Wave Challenge App
*/
enum WaveAppError: Error {
	case apiRequestFailed
	case unexpectedAPIResponse
}
