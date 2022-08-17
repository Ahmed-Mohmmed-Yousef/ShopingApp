//
//  MoreItemCell.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//

import UIKit

class MoreItemCell: UITableViewCell, CellProtocol {
    
    static let id = "MoreItemCell"
    
    var indexPath: IndexPath!
    @IBOutlet weak var titleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuerCell(vm: MoreItemVM, indexPath: IndexPath) {
        self.indexPath = indexPath
        titleLbl.text = vm.title
        
    }
    
}
