//
//  MoreContract.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMoreProtocol: ViewProtocol {
    func reloadWith(vms: [MoreItemVM])
    func updateWith(username: String, image: String)
    func loginHeader()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMoreProtocol {
    
    var view: PresenterToViewMoreProtocol? { get set }
    var interactor: PresenterToInteractorMoreProtocol? { get set }
    var router: PresenterToRouterMoreProtocol? { get set }
    
    func viewDidLoad()
    func configureCell<Cell: CellProtocol>(cell: Cell, at indexPath: IndexPath)
    func itemTapped(at index: Int)
    func logonHeaderTapped()
    func handelLoginNotification()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMoreProtocol {
    
    var presenter: InteractorToPresenterMoreProtocol? { get set }
    var credentials: Credentials? { get }
    func loadCredentials()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMoreProtocol {
    func lodginDataLoaded(credentials: Credentials)
    func loginDataFailure()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMoreProtocol {
    
    func goToLoginModule()
    func goToOrdersModule()
    func goFavoritesModule()
    func goAddessesModule()
    func goToSettingsModule()
    func presentShareAppVC(items: [Any])
}
