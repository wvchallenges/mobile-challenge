//
//  Formatters.swift
//  Wave-mobile-challenge
//
//  Created by John Warmann on 2017-04-10.
//  Copyright © 2017 LocalizeWiz. All rights reserved.
//

import UIKit

class Formatters: NSObject {

    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency

        return formatter
    }()
}
