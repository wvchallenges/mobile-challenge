//
//  ObservableType+Subscribing.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import RxSwift

// TODO: SW – missing unit tests
extension ObservableType {

    var subscribeOnceNowValue: Element? {
        let bag = DisposeBag()
        var value: Element?
        take(1).next { element in
            value = element
        }.disposed(by: bag)
        return value
    }

    func next(_ task: @escaping (Self.Element) -> Void) -> Disposable {
        return subscribe(onNext: { value in
            task(value)
        })
    }

}
