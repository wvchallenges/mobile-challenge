//
//  NSNumber+Format.swift
//  Wave
//
//  Created by cc on 16/12/1.
//  Copyright © 2016年 Wave. All rights reserved.
//

import Foundation

extension NSNumber {
    func dollarString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: self) ?? "$"
    }
}
