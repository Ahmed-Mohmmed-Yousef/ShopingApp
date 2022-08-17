//
//  LoginContract.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewLoginProtocol: ViewProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLoginProtocol {
    
    var view: PresenterToViewLoginProtocol? { get set }
    var interactor: PresenterToInteractorLoginProtocol? { get set }
    var router: PresenterToRouterLoginProtocol? { get set }
    
    func userEnter(email: String, password: String)
    func registerBrnTapped()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLoginProtocol {
    
    var presenter: InteractorToPresenterLoginProtocol? { get set }
    
    
    func login(email: String, password: String)
    func saveLoginData(credentials: Credentials)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLoginProtocol {
    
    func successLogin(credentials: Credentials)
    func failuerLogin(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLoginProtocol {
    func goToRgisterModule()
    func dismiss()
}
