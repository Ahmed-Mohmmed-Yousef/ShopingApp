//
//  CartRouter.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation
import UIKit

class CartRouter: PresenterToRouterCartProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = CartViewController.instance()
        
        let presenter: ViewToPresenterCartProtocol & InteractorToPresenterCartProtocol = CartPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CartRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CartInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
