//
//  CategoryContract.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCategoryProtocol: ViewProtocol {    
    func reloadCategories(with categoryVMs: [CategoryViewModel])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCategoryProtocol {
    
    var view: PresenterToViewCategoryProtocol? { get set }
    var interactor: PresenterToInteractorCategoryProtocol? { get set }
    var router: PresenterToRouterCategoryProtocol? { get set }
    
    func getCategories()
    func goToCategoryDetails(at indexPath: IndexPath)
    func configure<Cell: CellProtocol>(cell: Cell, at indexPath: IndexPath)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCategoryProtocol {
    
    var presenter: InteractorToPresenterCategoryProtocol? { get set }
    
    func getCategories()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCategoryProtocol {
    func successLoaded(categories: [Category])
    func fialuerLoaded(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCategoryProtocol {
    
}
