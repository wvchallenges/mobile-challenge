//
//  UIViewController+Inflating.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit

extension UIViewController {

    static var nameIdentifier: String {
        return String(describing: self)
    }

    /// Inflate receiving type from a storyboard based on `nameIdentifier`.
    ///
    /// - Parameters:
    ///   - storyboardName: Name of the storyboard to inflate from.
    ///   - bundle: Bundle to instantiate from (defaults to `main`).
    /// - Returns: Inflated view controller.
    static func inflate<T: RawRepresentable>(from storyboardName: T, bundle: Bundle = Bundle.main) -> Self where T.RawValue == String {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: nameIdentifier) as? Self else {
            // swiftlint:disable:next line_length
            fatalError("Failed to inflate `\(String(describing: self))` from `\(storyboardName.rawValue)` storyboard using identifier `\(nameIdentifier)` – do you have the correct names & storyboard + wiring & type?")
        }
        return viewController
    }

}
