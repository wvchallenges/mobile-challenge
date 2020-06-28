//
//  AppCoordinatorSpec.swift
//  ListingsTests
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RxSwift
@testable import Listings

class AppCoordinatorSpec: QuickSpec {
    override func spec() {
        describe("on instantiation") {
            var subject: AppCoordinator!

            beforeEach {
                subject = AppCoordinator()
            }
            it("should begin with main-flow of the app") {
                let state = subject.appState.subscribeOnceNowValue
                expect(state).to(equal(.main))
            }
        }
    }
}

