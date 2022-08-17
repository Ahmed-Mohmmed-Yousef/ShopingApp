//
//  ProductPresenter.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import Foundation

class ProductPresenter: ViewToPresenterProductProtocol {

    // MARK: Properties
    var view: PresenterToViewProductProtocol?
    var interactor: PresenterToInteractorProductProtocol?
    var router: PresenterToRouterProductProtocol?
}

extension ProductPresenter: InteractorToPresenterProductProtocol {
    
}
