//
//  GenericError.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-10.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit

class ServerError: Error {

    fileprivate(set) var errorMessage: String?
    fileprivate(set) var errorCode: Int

    init(errorObject: [String:Any], code: Int = -1) {
        if let message = errorObject["message"] as? String {
            self.errorMessage = message
        }
        self.errorCode = code
    }
}
