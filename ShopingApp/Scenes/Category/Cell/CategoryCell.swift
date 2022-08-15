//
//  CategoryCell.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell, CellProtocol {
    
    static let id = "CategoryCell"
    
    var indexPath: IndexPath!

    @IBOutlet weak var categoryIV: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuerCell(vm: CategoryViewModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        let url = URL(string: vm.image)
        categoryIV.kf.setImage(with: url)
        lblName.text = vm.name.capitalized
    }

}
