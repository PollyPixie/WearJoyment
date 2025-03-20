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
    //private let dataSource: [TabBarItem] = [
       // .clothingVS, .outfitVS
    //] //точно нужно?
    
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
        
        tabBar.tintColor = .black // Цвет активной вкладки (иконка + текст)
        tabBar.unselectedItemTintColor = .darkGray // Цвет неактивных вкладок
        tabBar.backgroundColor = UIColor(white: 0.85, alpha: 1) // Фон нижнего TabBar (но есть слой сверху можно убрать)
    }
    
    func getTabBarController(_ item: TabBarItem) -> UINavigationController {
        let navController = UINavigationController()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(white: 0.85, alpha: 1) // Фон NavigationBar (верхняя панель)
        
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(.black),
            .font: UIFont.systemFont(ofSize: 18, weight: .thin),
            .kern: 1.5
        ]
        
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        
        navController.tabBarItem.title = item.title
        navController.tabBarItem.image = item.icon
        
        return navController
    }
}

