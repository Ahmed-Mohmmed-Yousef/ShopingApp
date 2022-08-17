//
//  RegisterInteractor.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import Foundation

class RegisterInteractor: PresenterToInteractorRegisterProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterRegisterProtocol?
    
    func registerUser(name: String, email: String, phone: String, password: String, image: String) {
        UserAPI.shared.register(name: name, email: email, phone: phone, password: password, image: image) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                if let data = response.data, response.status {
                    self.presenter?.successRegistration(credentials: Credentials(registerData: data))
                } else {
                    self.presenter?.fialuer(messsage: response.message)
                }
            case .failure(let error):
                self.presenter?.fialuer(messsage: error.description)
            }
        }
    }
    
    func saveCredentials(credentials: Credentials) {
        LocalInfo.shared.setLoginData(credentials: credentials)
    }
}
