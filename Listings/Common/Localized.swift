//
//  Localized.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-29.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation

protocol StringsLoadable: RawRepresentable where RawValue == String {
    var tableName: String { get }
}
extension StringsLoadable {
    var tableName: String {
        return String(describing: type(of: self))
    }
}

final class Localized {
    static func string<T: StringsLoadable>(_ loadableString: T, bundle: Bundle = Bundle.main) -> String {
        return NSLocalizedString(
            loadableString.rawValue,
            tableName: loadableString.tableName,
            bundle: bundle,
            comment: ""
        )
    }
}
