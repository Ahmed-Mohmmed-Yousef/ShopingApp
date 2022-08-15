//
//  CategoryRouter.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation
import UIKit

class CategoryRouter: PresenterToRouterCategoryProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = CategoryViewController.instance()
        
        let presenter: ViewToPresenterCategoryProtocol & InteractorToPresenterCategoryProtocol = CategoryPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CategoryRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CategoryInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
