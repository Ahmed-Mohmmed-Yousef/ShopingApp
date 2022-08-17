//
//  LoginViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//  
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterLoginProtocol?
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet var loginBtn: UIButton!
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }

    private func setupView() {
        setupNavBar(title: "LOGIN")
        emailTF.superview?.setCornerRadius(value: 5)
        emailTF.superview?.setShadow()
        passwordTF.superview?.setCornerRadius(value: 5)
        passwordTF.superview?.setShadow()
        loginBtn.superview?.setCornerRadius(value: 5)
        loginBtn.superview?.setShadow()
        loginBtn.setCornerRadius(value: 5)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        guard let email = emailTF.text, let password = passwordTF.text else { return }
        presenter?.userEnter(email: email, password: password)
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        presenter?.registerBrnTapped()
    }
    
}

extension LoginViewController: PresenterToViewLoginProtocol{
    // TODO: Implement View Output Methods
}
