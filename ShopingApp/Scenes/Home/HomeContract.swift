//
//  HomeContract.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: ViewProtocol {
    
    func productsSuccessLoaded(bannerVMs: [BannerViewModel], productVMs: [ProductViewModel])
    func productFailuerLoading(message: String?)
    func updateProductCell(productVM: ProductViewModel)
    

}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    var numberOfProducts: Int { get }
    func viewDidLoad()
    func configureProductCell(cell: ProductCollectionViewCellProtocol, indexPath: IndexPath)
    func configureBannerCell(cell: BannerCollectionViewCellProtocol, indexPath: IndexPath)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    
    func getHomeData(userToken: String?)
    func addOrDeleteFavorite(userToken: String, with productId: Int)
    func addOrDeleteCart(userToken: String, with productId: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func setComingData(homeResponse: HomeDataResponse)
    func errorOccured(error: APIError)
    
    // Favorite Actions
    func updateFavriteOfProduct(with newValue: AddedOrDeletedProduct, message: String)
    
    // Carts Action
    func updateCartsOfProduct(with newValue: AddOrDeleteCartProduct, message: String)
    
    func failureToUpdateOfProduct(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    
}
