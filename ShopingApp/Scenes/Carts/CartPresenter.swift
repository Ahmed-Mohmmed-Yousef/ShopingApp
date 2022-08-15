//
//  CartPresenter.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation

class CartPresenter: ViewToPresenterCartProtocol {
    
    // MARK: Properties
    var view: PresenterToViewCartProtocol?
    var interactor: PresenterToInteractorCartProtocol?
    var router: PresenterToRouterCartProtocol?
        
    private var items: [CartItem] = []
    private var total: Double = 0
    
    func loadCarts() {
        view?.showIndicator()
        interactor?.loadCartItems(userToken: userToken)
                                                                                                                           
    }
    
    func completeOrder() {
//        view?.showIndicator()
    }
    
    func updateCartItem(at index: Int, by type: ChangeType) {
        let item = items[index]
        var value = item.quantity
        if type == .minus, value == 1 { return }
        view?.showIndicator()
        switch type {
        case .plus:
            value += 1
        case .minus:
            value -= 1
        }
        interactor?.updateCartItem(userToken: userToken, with: item.id, by: value)
    }
    
    func deleteCartItem(at index: Int) {
        view?.showIndicator()
        interactor?.deleteCartItem(userToken: userToken, with: items[index].id)
    }
    
    func configureCell<Cell>(cell: Cell, at indexPath: IndexPath) where Cell : CellProtocol {
        let cartItemVM = CartItemViewModel(cartItem: items[indexPath.row])
        cell.configuerCell(vm: cartItemVM as! Cell.T, indexPath: indexPath)
    }
}

extension CartPresenter: InteractorToPresenterCartProtocol {
    func successLoadedCardItems(cartData: CartData) {
        view?.hideIndicator()
        items = cartData.cartItems
        total = Double(cartData.total)
        view?.updateViewData(vms: items.map { CartItemViewModel(cartItem: $0) }, total: total.stringPrice)
    }
    
    func sucessUpdateCardItem(update: UpdateCardInfo) {
        view?.hideIndicator()
        guard let index = items.firstIndex(where: { $0.id == update.cart.id }) else { return }
        var cartItem = items[index]
        cartItem.updateQuantity(value: update.cart.quantity)
        items[index] = cartItem
        total = Double(update.total)
        view?.updateCartItem(vm: CartItemViewModel(cartItem: cartItem), total: total.stringPrice)
    }
    
    func successDeleteCardItem(info: DeletedCartItemInfo) {
        view?.hideIndicator()
        items.removeAll(where: { $0.id == info.cart.id})
        self.total = Double(info.total)
        view?.deleteCardItem(vms: items.map { CartItemViewModel(cartItem: $0) }, total: total.stringPrice)
    }
    
    func failuerResponse(message: String) {
        view?.fialuerAlert(message: message)
    }
    
    
}
