//
//  protocols.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//

import Foundation

protocol ViewProtocol {
    func showIndicator()
    
    func hideIndicator()
    
    func fialuerAlert(message: String?)
}

protocol ViewModelProtocol: Hashable {
    var id: Int { get }
}

protocol CellProtocol {
    associatedtype T: ViewModelProtocol
    var indexPath: IndexPath! { get set }
    func configuerCell(vm: T, indexPath: IndexPath)
}
