//
//  Providable.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-29.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation

protocol Providable {
    associatedtype T
    func provide() -> T
}

class Provider<T>: Providable {
    private let instructions: () -> T

    init(instructions: @escaping () -> T) {
        self.instructions = instructions
    }
    func provide() -> T {
        return instructions()
    }
}
