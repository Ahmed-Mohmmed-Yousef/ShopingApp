//
//  CartContract.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCartProtocol: ViewProtocol {
    func updateViewData(vms: [CartItemViewModel], total: String)
    func updateCartItem(vm: CartItemViewModel, total: String)
    func deleteCardItem(vms: [CartItemViewModel], total: String)
}

enum ChangeType {
    case plus
    case minus
}
// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCartProtocol {
    
    
    
    var view: PresenterToViewCartProtocol? { get set }
    var interactor: PresenterToInteractorCartProtocol? { get set }
    var router: PresenterToRouterCartProtocol? { get set }
    
    func loadCarts()
    func completeOrder()
    func updateCartItem(at index: Int, by type: ChangeType)
    func deleteCartItem(at index: Int)
    func configureCell<Cell: CellProtocol>(cell: Cell, at indexPath: IndexPath)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCartProtocol {
    
    var presenter: InteractorToPresenterCartProtocol? { get set }
    
    func loadCartItems(userToken: String)
    
    func updateCartItem(userToken: String, with id: Int, by value: Int)
    
    func deleteCartItem(userToken: String, with id: Int)
    
    
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCartProtocol {
    func successLoadedCardItems(cartData: CartData)
    func sucessUpdateCardItem(update: UpdateCardInfo)
    func successDeleteCardItem(info: DeletedCartItemInfo)
    
    func failuerResponse(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCartProtocol {
    
}
