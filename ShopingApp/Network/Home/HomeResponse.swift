//
//  HomeResponse.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import Foundation

// MARK: - HomeResponse
struct HomeDataResponse: Codable {
    let status: Bool
    let message: String?
    let data: HomeData?
}

// MARK: - DataClass
struct HomeData: Codable {
    let banners: [Banner]
    let products: [Product]
    let ad: String
}

// MARK: - Banner
struct Banner: Codable, Hashable {
    let id: Int
    let image: String
    let category, product: String?
}

struct BannerViewModel: Hashable {
    let image: String
    let category, product: String?
    
    init(banner: Banner) {
        image = banner.image
        category = banner.category
        product = banner.product
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let price, oldPrice: Double
    let discount: Int
    let image: String
    let name, productDescription: String
    let images: [String]
    var inFavorites, inCart: Bool

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case productDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
    
    mutating func updateFavState() {
        self.inFavorites = !self.inFavorites
    }
    
    mutating func updateInCartState() {
        self.inCart = !self.inCart
    }
    
    
}


struct ProductViewModel: Hashable {
    let id: Int
    let price, oldPrice: Double
    let discount: Int
    let image: String
    let name, productDescription: String
    let images: [String]
    let inFavorites, inCart: Bool
    
    init(product: Product) {
        self.id = product.id
        self.price = product.price
        self.oldPrice = product.oldPrice
        self.discount = product.discount
        self.image = product.image
        self.name = product.name
        self.productDescription = product.productDescription
        self.images = product.images
        self.inFavorites = product.inFavorites
        self.inCart = product.inCart
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: ProductViewModel, rhs: ProductViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
