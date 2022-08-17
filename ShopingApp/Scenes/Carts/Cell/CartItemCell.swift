//
//  CartItemCell.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//

import UIKit
import Kingfisher

protocol CartItemCellDeletgate: AnyObject {
    func plusTapped(at indexPath: IndexPath)
    func minusTapped(at indexPath: IndexPath)
    func deleteTapped(at indexPath: IndexPath)
}

class CartItemCell: UITableViewCell, CellProtocol {
    
    static let id = "CartItemCell"
    
    var indexPath: IndexPath!
    weak var delegate: CartItemCellDeletgate?

    @IBOutlet weak var itemIV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var oldPrceLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        quantityLbl.layer.masksToBounds = true
        quantityLbl.setCornerRadius(value: 10)
        
        self.itemIV.setCornerRadius(value: 10)
        itemIV.superview?.setShadow()
    }
    
    func configuerCell(vm: CartItemViewModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        let url = URL(string: vm.image)
        itemIV.kf.setImage(with: url)
        nameLbl.text = vm.name
        priceLbl.text = vm.priceString
        oldPrceLbl.isHidden = true
        if let oldPrice = vm.oldPriceString {
            oldPrceLbl.isHidden = false
            oldPrceLbl.text = oldPrice
        }
        quantityLbl.text = "\(vm.quantity)"
        
    }
    @IBAction func plusTapped(_ sender: Any) {
        delegate?.plusTapped(at: indexPath)
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        delegate?.minusTapped(at: indexPath)
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        delegate?.deleteTapped(at: indexPath)
    }
}
