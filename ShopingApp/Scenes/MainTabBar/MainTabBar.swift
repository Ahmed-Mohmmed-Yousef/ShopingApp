//
//  MainTabBar.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let homeNavigationController = UINavigationController(rootViewController: HomeRouter.createModule())
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let categoryNavigationController = UINavigationController(rootViewController: UIViewController())
        categoryNavigationController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2"))
        let favoriteNavigationController = UINavigationController(rootViewController: UIViewController())
        favoriteNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        let settingsNavigationController = UINavigationController(rootViewController: UIViewController())
        settingsNavigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        
        self.setViewControllers([
            homeNavigationController,
            categoryNavigationController,
            favoriteNavigationController,
            settingsNavigationController
        ], animated: true)
    }

}
