//
//  UserInfoHeader.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//

import UIKit
import Kingfisher

class UserInfoHeader: UIView {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
   
    
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
        let viewFromXib = Bundle.main.loadNibNamed("UserInfoHeader", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = bounds
        addSubview(viewFromXib)
        
        userImageView.superview?.setCircularCornerRadius()
        userImageView.superview?.setShadow()
        userImageView.setCircularCornerRadius()
    }
    
    func setupUserInfoHeader(name: String, image: String) {
        let url = URL(string: image)
        userImageView.kf.setImage(with: url)
        usernameLbl.text = name
        userImageView.contentMode = .scaleAspectFill
    }

}
