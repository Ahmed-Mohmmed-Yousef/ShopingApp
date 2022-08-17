//
//  ProductContract.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewProductProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterProductProtocol {
    
    var view: PresenterToViewProductProtocol? { get set }
    var interactor: PresenterToInteractorProductProtocol? { get set }
    var router: PresenterToRouterProductProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorProductProtocol {
    
    var presenter: InteractorToPresenterProductProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterProductProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterProductProtocol {
    
}
