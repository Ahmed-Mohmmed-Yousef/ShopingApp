//
//  CartInteractor.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import Foundation

class CartInteractor: PresenterToInteractorCartProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterCartProtocol?
    
    func loadCartItems(userToken: String) {
        CartsAPI.shared.getCarts(userToken: userToken) { [weak self] result in
            switch result {
            case .success(let response):
                if let cartData = response.data, response.status {
                    self?.presenter?.successLoadedCardItems(cartData: cartData)
                } else {
                    self?.presenter?.failuerResponse(message: response.message ?? "Failure at CartInteractor - loadCartItems")
                }
            case .failure(let error):
                self?.presenter?.failuerResponse(message: error.description)
            }
        }
    }
    
    func updateCartItem(userToken: String, with id: Int, by value: Int) {
        CartsAPI.shared.updateCartItem(userToken: userToken, productId: id, value: value) { [weak self] result in
            switch result {
            case .success(let response):
                if let cardUpdate = response.data, response.status {
                    self?.presenter?.sucessUpdateCardItem(update: cardUpdate)
                } else {
                    self?.presenter?.failuerResponse(message: response.message)
                }
            case .failure(let error):
                self?.presenter?.failuerResponse(message: error.description)
            }
        }
    }
    
    func deleteCartItem(userToken: String, with id: Int) {
        CartsAPI.shared.deleteFromCarts(userToken: userToken, productId: id) { [weak self] result in
            switch result {
            case .success(let response):
                if let deleteInfo = response.data, response.status {
                    self?.presenter?.successDeleteCardItem(info: deleteInfo)
                } else {
                    self?.presenter?.failuerResponse(message: response.message)
                }
            case .failure(let error):
                self?.presenter?.failuerResponse(message: error.description)
            }
        }
    }
}
