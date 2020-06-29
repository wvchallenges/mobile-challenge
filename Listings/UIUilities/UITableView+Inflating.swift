//
//  UITableView+Inflating.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var nameIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func dequeue<T: UITableViewCell>(reusable cellType: T.Type,
                                     with identifier: String = T.nameIdentifier,
                                     for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: ProductItemCell.nameIdentifier, for: indexPath)
        guard let typedCell = cell as? T else {
            // swiftlint:disable:next line_length
            fatalError("failed to cast dequeued cell `\(cell)` to a `\(T.nameIdentifier)` – have you registered the cell? are you using the correct identifier?")
        }
        return typedCell
    }
}
