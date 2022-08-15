//
//  ProductCollectionViewCell.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import UIKit
import Kingfisher

protocol ProductCollectionViewCellProtocol {
    var indexPath: IndexPath! { get set }
    func setupCell(productViewModel: ProductViewModel, indexPath: IndexPath)
    
}

protocol ProductCollectionViewCellDelegate: AnyObject {
    func userTapOnFavBtn(cell: ProductCollectionViewCellProtocol)
    func userTapOnCartBtn(cell: ProductCollectionViewCellProtocol)
}

class ProductCollectionViewCell: UICollectionViewCell, ProductCollectionViewCellProtocol {
    
    static let id = "ProductCollectionViewCell"
    var indexPath: IndexPath!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var productIV: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    weak var delegate: ProductCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(productViewModel: ProductViewModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        let url = URL(string: productViewModel.image)
        productIV.kf.setImage(with: url)
        descriptionLbl.text = productViewModel.name
        priceLbl.text = "\(productViewModel.price.stringPrice)"
        oldPriceLbl.text = "\(productViewModel.oldPrice.stringPrice)"
        if productViewModel.oldPrice == 0.0 {
            oldPriceLbl.isHidden = true
        }
        
        favBtn.tintColor = productViewModel.inFavorites ? tintColor : .lightGray
        cartBtn.tintColor = productViewModel.inCart ? tintColor : .lightGray
        
        discountLbl.superview?.isHidden = true
        oldPriceLbl.isHidden = true
        if productViewModel.discount > 0 {
            discountLbl.superview?.isHidden = false
            oldPriceLbl.isHidden = false
            discountLbl.text = " Discount \(productViewModel.discount) %  "
        }
        
        favBtn.addTarget(self, action: #selector(favBtnTapped), for: .touchUpInside)
        cartBtn.addTarget(self, action: #selector(cartBtnTapped), for: .touchUpInside)
    }
    
    @objc private func favBtnTapped() {
        delegate?.userTapOnFavBtn(cell: self)
    }
    
    @objc private func cartBtnTapped() {
        delegate?.userTapOnCartBtn(cell: self)
    }
}
