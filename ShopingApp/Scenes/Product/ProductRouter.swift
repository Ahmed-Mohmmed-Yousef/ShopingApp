//
//  ProductRouter.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import Foundation
import UIKit

class ProductRouter: PresenterToRouterProductProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ProductViewController()
        
        let presenter: ViewToPresenterProductProtocol & InteractorToPresenterProductProtocol = ProductPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ProductRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ProductInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
