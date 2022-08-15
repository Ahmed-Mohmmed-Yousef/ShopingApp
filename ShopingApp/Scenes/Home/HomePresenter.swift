//
//  HomePresenter.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//  
//

import Foundation

let userToken = "3ZhXaO2xGD3FuaM6ZRXSCYH2Vp4wtQCWvB1Gq8IRbv1Pmqhs8Kma8Cfxvx0Lgl1RpZWuOT"

class HomePresenter: ViewToPresenterHomeProtocol {

    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    private var products: [Product] = []
    private var banners : [Banner] = []
    var numberOfProducts: Int { return products.count }
    
    func viewDidLoad() {
        if !products.isEmpty && !banners.isEmpty { return }
        view?.showIndicator()
        interactor?.getHomeData(userToken: userToken)
    }
    
    func configureProductCell(cell: ProductCollectionViewCellProtocol, indexPath: IndexPath) {
        let product = products[indexPath.row]
        let productVM = ProductViewModel(product: product)
        cell.setupCell(productViewModel: productVM, indexPath: indexPath)
    }
    
    func configureBannerCell(cell: BannerCollectionViewCellProtocol, indexPath: IndexPath) {
        let banner = banners[indexPath.row]
        let bannerVM = BannerViewModel(banner: banner)
        cell.configuerCell(bannerVM: bannerVM)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func setComingData(homeResponse: HomeDataResponse) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.products = homeResponse.data?.products ?? []
            self.banners = homeResponse.data?.banners ?? []
            self.view?.hideIndicator()
            let bannerVMs = self.banners.map { BannerViewModel(banner: $0) }
            let productVms = self.products.map { ProductViewModel(product: $0) }
            self.view?.productsSuccessLoaded(bannerVMs: bannerVMs, productVMs: productVms)
        }
    }
    
    func errorOccured(error: APIError) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view?.productFailuerLoading(message: "ERRRORR")
        }
    }
    
    func updateFavriteOfProduct(with newValue: AddedOrDeletedProduct, message: String) {
        view?.hideIndicator()
        if let index = products.firstIndex(where: { $0.id == newValue.id }) {
            var newProduct = products[index]
            newProduct.updateFavState()
            products[index] = newProduct
            let pvm = ProductViewModel(product: products[index])
            self.view?.updateProductCell(productVM: pvm)
        }
    }
    
    func updateCartsOfProduct(with newValue: AddOrDeleteCartProduct, message: String) {
        view?.hideIndicator()
        if let index = products.firstIndex(where: { $0.id == newValue.id }) {
            var newProduct = products[index]
            newProduct.updateInCartState()
            products[index] = newProduct
            let pvm = ProductViewModel(product: products[index])
            self.view?.updateProductCell(productVM: pvm)
        }
    }
    
    func failureToUpdateOfProduct(message: String) {
        view?.fialuerAlert(message: message)
    }
    
}

// ProductCollectionViewCellDelegate
extension HomePresenter: ProductCollectionViewCellDelegate {
    func userTapOnFavBtn(cell: ProductCollectionViewCellProtocol) {
        view?.showIndicator()
        let id = products[cell.indexPath.row].id
        interactor?.addOrDeleteFavorite(userToken: userToken, with: id)
    }
    
    func userTapOnCartBtn(cell: ProductCollectionViewCellProtocol) {
        view?.showIndicator()
        let id = products[cell.indexPath.row].id
        interactor?.addOrDeleteCart(userToken: userToken, with: id)
    }
    
    
}
