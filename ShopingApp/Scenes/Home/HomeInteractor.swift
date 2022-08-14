//
//  HomeInteractor.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//  
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {
    

    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    
    func getHomeData(userToken: String?) {
        HomeAPI.shared.getHomeData(userToken: userToken) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let homeResponse):
                self.presenter?.setComingData(homeResponse: homeResponse)
            case .failure(let error):
                self.presenter?.errorOccured(error: error)
            }
        }
    }
    
    func addOrDeleteFavorite(userToken: String, with productId: Int) {
        FavoritesAPI.shared.addOrDeleteFavorite(userToken: userToken, with: productId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let addOrDeleteFavoret):
                if addOrDeleteFavoret.status {
                    self.presenter?.updateFavriteOfProduct(with: addOrDeleteFavoret.data.product, message: addOrDeleteFavoret.message)
                } else {
                    self.presenter?.failureToUpdateOfProduct(message: addOrDeleteFavoret.message)
                }
            case .failure:
                self.presenter?.failureToUpdateOfProduct(message: "Connection Error")
            }
        }
    }
    
    func addOrDeleteCart(userToken: String, with productId: Int) {
        CartsAPI.shared.addOrDeleteWithCarts(userToken: userToken, productId: productId) { result in
            switch result {
            case .success(let addOrDeleteCart):
                if addOrDeleteCart.status {
                    self.presenter?.updateCartsOfProduct(with: addOrDeleteCart.data!.product, message: addOrDeleteCart.message)
                } else {
                    self.presenter?.failureToUpdateOfProduct(message: addOrDeleteCart.message)
                }
            case .failure:
                self.presenter?.failureToUpdateOfProduct(message: "Connection Error")
            }
        }
    }
}
