//
//  LoginInteractor.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//  
//

import Foundation

class LoginInteractor: PresenterToInteractorLoginProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterLoginProtocol?
    
    func login(email: String, password: String) {
        UserAPI.shared.login(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                if let data = response.data, response.status {
                    self.presenter?.successLogin(credentials: Credentials(loginData: data))
                } else {
                    self.presenter?.failuerLogin(message: response.message)
                }
            case .failure(let error):
                self.presenter?.failuerLogin(message: error.description)
            }
        }
    }
    
    func saveLoginData(credentials: Credentials) {
        LocalInfo.shared.setLoginData(credentials: credentials)
    }
    
}
