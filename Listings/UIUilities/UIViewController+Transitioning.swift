//
//  UIViewController+Transitioning.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Embed a view controller into a container-view supplied by the receiver.
    ///
    /// - Parameters:
    ///   - desiredViewController: The view controller to be embedded.
    ///   - containerView: The container view to emebd into.
    ///   - unwantedViewController: A previously embedded view controller to remove (defaults to `nil`).
    func embed(_ desiredViewController: UIViewController,
               in containerView: UIView,
               andRemove unwantedViewController: UIViewController? = nil) {
        // 1. remove previously-embedded/unwanted view controller
        if let viewController = unwantedViewController {
            viewController.willMove(toParent: nil)
            view.removeFromSuperview()
            viewController.removeFromParent()
        }
        // 2. embed the desired view controller
        addChild(desiredViewController)
        desiredViewController.view.frame = containerView.bounds
        containerView.addSubview(desiredViewController.view)
        desiredViewController.didMove(toParent: self)
    }

}
