//
//  BundleFileLoader.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-26.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation

enum ProductFixtures: String {
    case product = "Product"
    case productList = "ProductList"
}

class BundleFileLoader {

    static func load<T: RawRepresentable>(_ fileName: T, _ ext: String) -> Data where T.RawValue == String {
        guard let fileUrl = Bundle(for: self)
            .url(forResource:
                fileName.rawValue,
                 withExtension: ext
            ),
            let data = try? Data(contentsOf: fileUrl) else {
                fatalError("Failed to load data from `\(fileName.rawValue).\(ext)`, do you have an incorrect file name or extension?")
        }
        return data
    }

    static func loadJsonFixture<F: RawRepresentable, T: Decodable>(_ fixture: F, andParseTo type: T.Type) throws -> T where F.RawValue == String {
        let data = load(fixture, "json")
        return try JSONDecoder().decode(type, from: data)
    }

}
