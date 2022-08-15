//
//  CategoryPresenter.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation

class CategoryPresenter: ViewToPresenterCategoryProtocol {

    // MARK: Properties
    var view: PresenterToViewCategoryProtocol?
    var interactor: PresenterToInteractorCategoryProtocol?
    var router: PresenterToRouterCategoryProtocol?
    
    private var categories: [Category] = []
    
    func getCategories() {
        if !categories.isEmpty { return }
        view?.showIndicator()
        interactor?.getCategories()
    }
    
    func goToCategoryDetails(at indexPath: IndexPath) {
        // got to view 
    }
    
    func configure<Cell>(cell: Cell, at indexPath: IndexPath) where Cell : CellProtocol {
        let categoryVM = CategoryViewModel(category: categories[indexPath.row])
        cell.configuerCell(vm: categoryVM as! Cell.T, indexPath: indexPath)
    }
    
}

extension CategoryPresenter: InteractorToPresenterCategoryProtocol {
    func successLoaded(categories: [Category]) {
        view?.hideIndicator()
        self.categories = categories
        view?.reloadCategories(with: categories.map { CategoryViewModel(category: $0) })
    }
    
    func fialuerLoaded(message: String) {
        view?.fialuerAlert(message: message)
    }
    
    
}
