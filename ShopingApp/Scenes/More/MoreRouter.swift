//
//  MoreRouter.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//  
//

import Foundation
import UIKit

class MoreRouter: PresenterToRouterMoreProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MoreViewController.instance()
        
        let presenter: ViewToPresenterMoreProtocol & InteractorToPresenterMoreProtocol = MorePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MoreRouter(view: viewController)
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MoreInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func goToLoginModule() {
        let login = LoginRouter.createModule()
        view.present(login, animated: true)
    }
    
    func goToOrdersModule() {
        let vc = UIViewController()
        vc.view.backgroundColor = vc.view.tintColor
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goFavoritesModule()  {
        let vc = UIViewController()
        vc.view.backgroundColor = vc.view.tintColor
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goAddessesModule()  {
        let vc = UIViewController()
        vc.view.backgroundColor = vc.view.tintColor
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToSettingsModule() {
        let vc = UIViewController()
        vc.view.backgroundColor = vc.view.tintColor
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentShareAppVC(items: [Any]) {
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        ac.popoverPresentationController?.barButtonItem = 
        view.present(ac, animated: true)
    }
    
}
