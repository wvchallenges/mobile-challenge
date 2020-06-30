//
//  Double+Extensions.swift
//  WaveChallenge-SwiftUI
//
//  Created by John De Guzman on 2020-06-29.
//

import Foundation

extension Double {
    func getPrice() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        let number = NSNumber(value: self)
        
        if let formatted =  formatter.string(from: number) {
            return formatted
        }
        
        return ""
    }
}
