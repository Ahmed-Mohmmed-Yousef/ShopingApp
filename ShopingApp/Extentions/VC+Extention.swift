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
    
    func fialuerAlert(message: String?) {
        view.isUserInteractionEnabled = true
        ProgressHUD.showFailed(message, interaction: true)
    }
    
    func setupNavBar(title: String?) {
        navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
        self.navigationController?.navigationBar.barTintColor = view.tintColor
    }
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var shadowRadius:CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    
    @IBInspectable var shadowColor:UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var shadowOffset:CGSize {
        set {
            layer.shadowOffset = newValue
        }
        get {
            return layer.shadowOffset
        }
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
