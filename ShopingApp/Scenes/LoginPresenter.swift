//
//  LoginPresenter.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//  
//

import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol {

    // MARK: Properties
    var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
    
    func userEnter(email: String, password: String) {
        view?.showIndicator()
        interactor?.login(email: email, password: password)
    }
    
    func registerBrnTapped() {
        router?.goToRgisterModule()
    }
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func successLogin(credentials: Credentials) {
        view?.hideIndicator()
        interactor?.saveLoginData(credentials: credentials)
        DispatchQueue.main.async { [weak self] in
            FireNotification.name(name: .newCredentials)
            self?.router?.dismiss()
        }
    }
    
    
    func failuerLogin(message: String) {
        view?.fialuerAlert(message: message)
    }
}
