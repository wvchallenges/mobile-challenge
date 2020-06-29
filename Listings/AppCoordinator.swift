//
//  AppCoordinator.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import RxSwift

enum AppState {
    case tour
    case auth
    case main
}

final class AppCoordinator {
    let appState = BehaviorSubject(value: AppState.main)
}
