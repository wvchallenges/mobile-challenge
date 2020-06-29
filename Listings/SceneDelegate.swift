//
//  SceneDelegate.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-26.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import UIKit
import SwiftyBeaver

class SceneDelegate: UIResponder {
    var window: UIWindow?
    private lazy var dependencyRegistrar = DependencyRegistrar()
}

extension SceneDelegate: UIWindowSceneDelegate {

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        SwiftyBeaver.setupLogging()
        log.info("app launch")
        intantiateAppFlow(for: scene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}

fileprivate extension SceneDelegate {

    func intantiateAppFlow(for scene: UIScene) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Failed to load app UIScene")
        }
        window = UIWindow(windowScene: windowScene)
        // swiftlint:disable:next force_unwrapping
        let appUiFactory = dependencyRegistrar.resolver.resolve(AppUIFactory.self)!
        window?.rootViewController = appUiFactory.makeAppFlow()
        window?.makeKeyAndVisible()
    }

}
