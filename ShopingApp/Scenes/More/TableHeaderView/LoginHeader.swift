//
//  LoginHeader.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//

import UIKit

protocol LoginHeaderDeletgate: AnyObject {
    func userTapped()
}

class LoginHeader: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    weak var delegate: LoginHeaderDeletgate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let viewFromXib = Bundle.main.loadNibNamed("LoginHeader", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = bounds
        addSubview(viewFromXib)
        
        imageView.superview?.setCircularCornerRadius()
        imageView.superview?.setShadow()
//        imageView.setCircularCornerRadius()
        
    }
    @IBAction func userTapped(_ sender: Any) {
        delegate?.userTapped()
    }
}
