//
//  BannerCollectionViewCell.swift
//  ShopingApp
//
//  Created by Ahmed on 12/08/2022.
//

import UIKit
import Kingfisher

protocol BannerCollectionViewCellProtocol {
    func configuerCell(bannerVM: BannerViewModel)
}

class BannerCollectionViewCell: UICollectionViewCell, BannerCollectionViewCellProtocol {

    @IBOutlet weak var imageView: UIImageView!
    static let id = "BannerCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuerCell(bannerVM: BannerViewModel) {
        let url = URL(string: bannerVM.image)
        imageView.kf.setImage(with: url)
    }

}
