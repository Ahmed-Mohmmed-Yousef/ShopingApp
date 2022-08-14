//
//  VC+Extention.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import UIKit
import ProgressHUD


extension UIViewController {
    
    static var vcIdentifier: String { String(describing: self) }
    
    static func instance() -> Self {
        let vc = UIStoryboard(name: vcIdentifier, bundle: .main).instantiateViewController(withIdentifier: vcIdentifier) as! Self
        return vc
    }
    
    func showIndicator() {
        view.isUserInteractionEnabled = false
        ProgressHUD.show("Loading...")
    }
    
    func hideIndicator() {
        view.isUserInteractionEnabled = true
        ProgressHUD.dismiss()
    }
    
    func fialuerAlert(message: String) {
        view.isUserInteractionEnabled = true
        ProgressHUD.showFailed(message, interaction: true)
    }
}


extension Double {
    var stringPrice: String {
        return String(format: "%.2f", self)
    }
}
