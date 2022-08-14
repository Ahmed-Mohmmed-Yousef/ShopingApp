//
//  HomeRouter.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = HomeViewController.instance()
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol & ProductCollectionViewCellDelegate = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
