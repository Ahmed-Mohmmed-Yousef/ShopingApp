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
        let categoryNavigationController = UINavigationController(rootViewController: CategoryRouter.createModule())
        categoryNavigationController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2"))
        let cartNavigationController = UINavigationController(rootViewController: CartRouter.createModule())
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        let moreNavigationController = UINavigationController(rootViewController: MoreRouter.createModule())
        moreNavigationController.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle"), selectedImage: UIImage(systemName: "ellipsis.circle.fill"))
        
        self.setViewControllers([
//            homeNavigationController,
//            categoryNavigationController,
//            cartNavigationController,
            moreNavigationController
        ], animated: true)
    }
    
    private func setupNavBar(navControllr: UINavigationController) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Arial", size: 32)!]
        navControllr.navigationBar.standardAppearance = appearance
        navControllr.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navControllr.navigationBar.compactAppearance = appearance.copy()
    }

}
