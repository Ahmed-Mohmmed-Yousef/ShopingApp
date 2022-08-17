//
//  MoreInteractor.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//  
//

import Foundation

class MoreInteractor: PresenterToInteractorMoreProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterMoreProtocol?
    
    var credentials: Credentials? {
        LocalInfo.shared.credentials
    }
    
    func loadCredentials() {
        if let credentials = LocalInfo.shared.credentials {
            presenter?.lodginDataLoaded(credentials: credentials)
        } else { presenter?.loginDataFailure() }
    }
    
}
