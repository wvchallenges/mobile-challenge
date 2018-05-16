//
//  Utilities.swift
//  Wave-challenge
//
//  Created by Siddhesh Mahadeshwar on 16/05/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import Foundation
import UIKit


private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
    return formatter
}()

func priceString(_ price: Float) -> String {
    return formatter.string(from: price as NSNumber)!
}

extension UIViewController {
    
    private func showAlert(title: String = "", message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        vc.addAction(okAction)
        self.present(vc, animated: true, completion: nil)
    }
    
    func showErrorAlert(message: String) {
        showAlert(title: "Error", message: message)
    }
}
