//
//  ProductsDataServicing.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-28.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import RxSwift

protocol ProductsDataServicing {
    // TODO: SW – replace with type that offers better access control
    var products: BehaviorSubject<[Product]> { get }

    func fetchProducts() -> Single<[Product]>
}
