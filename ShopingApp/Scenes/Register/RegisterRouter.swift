//
//  RegisterRouter.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import Foundation
import UIKit

class RegisterRouter: PresenterToRouterRegisterProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = RegisterViewController.instance()
        
        let presenter: ViewToPresenterRegisterProtocol & InteractorToPresenterRegisterProtocol = RegisterPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = RegisterRouter(vc: viewController)
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = RegisterInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    let vc: UIViewController
    
    init(vc: UIViewController) {
        self.vc = vc
    }
    
    func dismiss() {
        vc.dismiss(animated: true)
    }
}
