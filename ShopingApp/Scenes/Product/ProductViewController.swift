//
//  ProductViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterProductProtocol?
    
}

extension ProductViewController: PresenterToViewProductProtocol{
    // TODO: Implement View Output Methods
}
