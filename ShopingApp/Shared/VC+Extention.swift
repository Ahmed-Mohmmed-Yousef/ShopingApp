//
//  VC+Extention.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import UIKit
import ProgressHUD
import SwiftUI


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
    
    func fialuerAlert(message: String?) {
        view.isUserInteractionEnabled = true
        ProgressHUD.showFailed(message, interaction: true)
    }
    
    func setupNavBar(title: String?) {
        navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
        self.navigationController?.navigationBar.barTintColor = view.tintColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension UIView {
    
    @objc func setCircularCornerRadius() {
        self.setCornerRadius(value: frame.width/2)
    }
    
    @objc func setCornerRadius(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func setShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.3
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
}

extension UIImageView {
    
    override func setCornerRadius(value: CGFloat) {
        super.setCornerRadius(value: value)
        clipsToBounds = true
    }
    
    override func setCircularCornerRadius() {
        super.setCircularCornerRadius()
        clipsToBounds = true
    }
    
    func base64EncodedString() -> String {
        return image?.jpegData(compressionQuality: 0.5)?.base64EncodedString() ?? ""
    }
}

extension UIButton {
    override func setCornerRadius(value: CGFloat) {
        super.setCornerRadius(value: value)
        layer.masksToBounds = true
    }
    
    override func setCircularCornerRadius() {
        super.setCircularCornerRadius()
        layer.masksToBounds = true
    }
}


extension Double {
    var stringPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EGP"
        return formatter.string(from: NSNumber(value: self)) ?? "n/a"//String(format: "%.2f", self)
    }
}
