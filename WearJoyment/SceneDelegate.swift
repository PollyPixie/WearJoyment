//
//  SceneDelegate.swift
//  WearJoyment
//
//  Created by Полина Соколова on 17.03.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let clothingManager = ClothingManager.shared
    private let outfitManager = OutfitManager.shared
    
    private let allTabBarItems = TabBarItem.allTabBarItems

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let tabBarController = TabBarController()
        
        tabBarController.viewControllers?.enumerated().forEach{ index, vc in
            guard let navVC = vc as? UINavigationController else { return}
            pushViewController(index: index, controller: navVC)
        }
        
        window?.rootViewController = UINavigationController(rootViewController: tabBarController)
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    func pushViewController(index: Int, controller: UINavigationController) {
        switch allTabBarItems[index] {
        case .clothingVS:
            let clothingVC = ClothingViewController(dataManager: clothingManager)
            clothingVC.title = TabBarItem.clothingVS.title
            controller.pushViewController(clothingVC, animated: false)
            
        case .outfitVS:
            let outfitsVC = OutfitsViewController(dataManager: outfitManager)
            outfitsVC.title = TabBarItem.outfitVS.title
            controller.pushViewController(outfitsVC, animated: false)
        }
    }
}


