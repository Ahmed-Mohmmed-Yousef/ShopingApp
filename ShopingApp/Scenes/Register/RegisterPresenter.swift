//
//  RegisterPresenter.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import Foundation

class RegisterPresenter: ViewToPresenterRegisterProtocol {

    // MARK: Properties
    var view: PresenterToViewRegisterProtocol?
    var interactor: PresenterToInteractorRegisterProtocol?
    var router: PresenterToRouterRegisterProtocol?
    
    func registerTapped(name: String, email: String, phone: String, password: String, image: String) {
        view?.showIndicator()
        interactor?.registerUser(name: name, email: email, phone: phone, password: password, image: image)
    }
}

extension RegisterPresenter: InteractorToPresenterRegisterProtocol {
    func successRegistration(credentials: Credentials) {
        view?.hideIndicator()
        // save credentials
        interactor?.saveCredentials(credentials: credentials)
        // dissmis and update
        DispatchQueue.main.async { [weak self] in
            FireNotification.name(name: .newCredentials)
            self?.router?.dismiss()
        }
        
    }
    
    
    func fialuer(messsage: String) {
        // show error msg
        view?.fialuerAlert(message: messsage)
    }
    
    
}
