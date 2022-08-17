//
//  RegisterContract.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewRegisterProtocol: ViewProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterRegisterProtocol {
    
    var view: PresenterToViewRegisterProtocol? { get set }
    var interactor: PresenterToInteractorRegisterProtocol? { get set }
    var router: PresenterToRouterRegisterProtocol? { get set }
    
    func registerTapped(name: String, email: String, phone: String, password: String, image: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorRegisterProtocol {
    
    var presenter: InteractorToPresenterRegisterProtocol? { get set }
    
    func registerUser(name: String, email: String, phone: String, password: String, image: String)
    func saveCredentials(credentials: Credentials)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterRegisterProtocol {
    func successRegistration(credentials: Credentials)
    func fialuer(messsage: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterRegisterProtocol {
    func dismiss()
}
