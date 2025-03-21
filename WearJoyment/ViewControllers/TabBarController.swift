//
//  TabBarController.swift
//  WearJoyment
//
//  Created by Полина Соколова on 20.03.25.
//

import UIKit

enum TabBarItem {
    case clothingVS
    case outfitVS
    
    var title: String {
        switch self {
        case .clothingVS: return "Гардероб"
        case .outfitVS: return "Аутфиты"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .clothingVS: return UIImage(systemName: "hanger")
        case .outfitVS: return UIImage(systemName: "square.grid.2x2")
        }
    }
    
    static let allTabBarItems = [clothingVS, outfitVS]
}

// MARK: - TabBarController
final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

// MARK: - Private Methods
private extension TabBarController {
    func setupTabBar() {
        let controllers: [UINavigationController] = TabBarItem.allTabBarItems.map { item in
            getTabBarController(item)
        }
        setViewControllers(controllers, animated: true)
        
        tabBar.tintColor = ColorsConstants.darkGray
        tabBar.unselectedItemTintColor = ColorsConstants.darkBlue
        tabBar.backgroundColor = ColorsConstants.lightBlue
    }
    
    func getTabBarController(_ item: TabBarItem) -> UINavigationController {
        let navController = UINavigationController()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = ColorsConstants.lightBlue
        
        appearance.titleTextAttributes = [
            .foregroundColor: ColorsConstants.darkGray,
            .font: UIFont.systemFont(ofSize: 18, weight: .thin),
            .kern: 1.5
        ]
        
        appearance.buttonAppearance.normal.titleTextAttributes = [
            .foregroundColor: ColorsConstants.darkBlue
           ]
        
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        navController.navigationBar.tintColor = ColorsConstants.darkBlue
        
        navController.tabBarItem.title = item.title
        navController.tabBarItem.image = item.icon
        
        return navController
    }
}

