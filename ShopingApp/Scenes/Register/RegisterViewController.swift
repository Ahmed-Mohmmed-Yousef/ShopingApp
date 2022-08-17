//
//  RegisterViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 17/08/2022.
//  
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterRegisterProtocol?
    private let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupNavBar(title: "Register")
        
        userImageView.superview?.setCircularCornerRadius()
        userImageView.superview?.setShadow()
        userImageView.setCircularCornerRadius()
        userImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handelUserImageTapped))
        tap.numberOfTapsRequired = 1
        userImageView.addGestureRecognizer(tap)
        
        usernameTF.superview?.setCornerRadius(value: 5)
        usernameTF.superview?.setShadow()
        
        emailTF.superview?.setCornerRadius(value: 5)
        emailTF.superview?.setShadow()
        
        phoneTF.superview?.setCornerRadius(value: 5)
        phoneTF.superview?.setShadow()
        
        passwordTF.superview?.setCornerRadius(value: 5)
        passwordTF.superview?.setShadow()
        
        registerBtn.superview?.setCornerRadius(value: 5)
        registerBtn.superview?.setShadow()
        registerBtn.setCornerRadius(value: 5)
    }
    
    @objc private func handelUserImageTapped() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func regisetrTapped(_ sender: Any) {
        guard let username = usernameTF.text,
              let email = emailTF.text,
              let phone = phoneTF.text,
              let password = passwordTF.text
        else { return }
        presenter?.registerTapped(name: username, email: email, phone: phone, password: password, image: userImageView.base64EncodedString())
    }
    
}

extension RegisterViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImageView.contentMode = .scaleAspectFill
            userImageView.image = pickedImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension RegisterViewController: PresenterToViewRegisterProtocol{
    // TODO: Implement View Output Methods
}
