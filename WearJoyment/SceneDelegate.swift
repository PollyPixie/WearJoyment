//
//  SceneDelegate.swift
//  WearJoyment
//
//  Created by Полина Соколова on 17.03.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let outfitsVC = OutfitsViewController(dataManager: OutfitManager.shared)
        let navigationController = UINavigationController(rootViewController: outfitsVC) 
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

