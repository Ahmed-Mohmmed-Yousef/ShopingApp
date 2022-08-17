//
//  MorePresenter.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//  
//

import Foundation

private struct Item {
    let name: String
    let action: () -> ()
}

struct MoreItemVM: ViewModelProtocol {
    let id: Int
    var title: String
}

class MorePresenter: ViewToPresenterMoreProtocol {

    // MARK: Properties
    var view: PresenterToViewMoreProtocol?
    var interactor: PresenterToInteractorMoreProtocol?
    var router: PresenterToRouterMoreProtocol?
    
    var haveACredentials: Bool { interactor?.credentials != nil }
    private var moreItems: [Item] = []
    private var moreItemVMs: [MoreItemVM] {
        return moreItems.enumerated().map { index, item in
            return MoreItemVM(id: index, title: item.name)
        }
    }
    
    func viewDidLoad() {
        if moreItems.isEmpty { setupMoreItems() }
        interactor?.loadCredentials()
        view?.reloadWith(vms: moreItemVMs)
        
    }
    
    private func setupMoreItems() {
        moreItems.append(contentsOf: [
            Item(name: "My Orders", action: {
                self.router?.goToOrdersModule()
            }),
            Item(name: "My Addresses", action: {
                self.router?.goToOrdersModule()
            }),
            Item(name: "My Favorites", action: {
                self.router?.goToOrdersModule()
            }),
            Item(name: "Share", action: {
                self.router?.presentShareAppVC(items: ["This is sharable content"])
            }),
        ])
        
        if haveACredentials {
            moreItems.insert(
                Item(name: "Logout", action: {
                self.router?.goToOrdersModule()
            }), at: moreItems.count - 1)
        }
    }
    
    func logonHeaderTapped() {
        router?.goToLoginModule()
    }
    
    func itemTapped(at index: Int) {
        if !haveACredentials { view?.fialuerAlert(message: "You are not logged, please login first."); return }
        moreItems[index].action()
    }
    
    func configureCell<Cell>(cell: Cell, at indexPath: IndexPath) where Cell : CellProtocol {
        let vm = MoreItemVM(id: indexPath.row, title: moreItems[indexPath.row].name)
        cell.configuerCell(vm: vm as! Cell.T, indexPath: indexPath)
    }
    
    func handelLoginNotification() {
        interactor?.loadCredentials()
    }
}

extension MorePresenter: InteractorToPresenterMoreProtocol {
    
    func lodginDataLoaded(credentials: Credentials) {
        view?.updateWith(username: credentials.name, image: credentials.image)
    }
    
    func loginDataFailure() {
        view?.fialuerAlert(message: "Can't Login to your account")
    }
    
}
