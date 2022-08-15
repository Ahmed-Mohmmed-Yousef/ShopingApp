//
//  CategoryInteractor.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation

class CategoryInteractor: PresenterToInteractorCategoryProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterCategoryProtocol?
    
    func getCategories() {
        CategoryAPI.shared.getCategories { [unowned self] result in
            switch result {
                
            case .success(let response):
                if let categories = response.data?.data {
                    self.presenter?.successLoaded(categories: categories)
                } else {
                    self.presenter?.fialuerLoaded(message: response.message ?? "Un handeld error - get Categories")
                }
            case .failure(let error):
                self.presenter?.fialuerLoaded(message: error.description)
            }
        }
    }
}
