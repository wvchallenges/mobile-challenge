//
//  WaveChallenge_SwiftUIApp.swift
//  WaveChallenge-SwiftUI
//
//  Created by John De Guzman on 2020-06-29.
//

import SwiftUI

@main
struct WaveChallenge_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: testProductStore)
        }
    }
}
