//
//  LoginRouter.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//  
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterLoginProtocol {
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        let viewController = LoginViewController.instance()
        
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LoginRouter(view: viewController)
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = LoginInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return UINavigationController(rootViewController: viewController)
    }
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func goToRgisterModule() {
        let vc = RegisterRouter.createModule()
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func dismiss() {
        view.dismiss(animated: true, completion: nil)
    }
    
}
