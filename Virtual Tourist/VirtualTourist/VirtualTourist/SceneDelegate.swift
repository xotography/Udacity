//
//  SceneDelegate.swift
//  VirtualTourist
//
//  Created by Ariya Behjat on 03/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let vc = TravelMapViewController()
        let nvc = UINavigationController(rootViewController: vc)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }

}

