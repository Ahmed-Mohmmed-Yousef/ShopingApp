//
//  CartsResponse.swift
//  ShopingApp
//
//  Created by Ahmed on 13/08/2022.
//

import Foundation

// MARK: - GetCartsResponse
struct GetCartsResponse: Codable {
    let status: Bool
    let message: String?
    let data: CartData?
}

// MARK: - DataClass
struct CartData: Codable {
    let cartItems: [CartItem]
    let subTotal, total: Int

    enum CodingKeys: String, CodingKey {
        case cartItems = "cart_items"
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - CartItem
struct CartItem: Codable {
    let id, quantity: Int
    let product: CartProduct
}

// MARK: - Product
struct CartProduct: Codable {
    let id, price, oldPrice, discount: Int
    let image: String
    let name, productDescription: String
    let images: [String]
    let inFavorites, inCart: Bool

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case productDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}


// MARK: - AddOrDeleteWithCartsResponse
struct AddOrDeleteWithCartsResponse: Codable {
    let status: Bool
    let message: String
    let data: AddOrDeleteCartProductInfo?
}

// MARK: - AddOrDeleteCartProductInfo
struct AddOrDeleteCartProductInfo: Codable {
    let id, quantity: Int
    let product: AddOrDeleteCartProduct
}

// MARK: - AddOrDeleteCartProduct
struct AddOrDeleteCartProduct: Codable {
    let id: Int
//    let price, oldPrice, discount: Int
//    let image: String
//    let name: String
//    let productDescription: String?

    enum CodingKeys: String, CodingKey {
        case id
//        case price
//        case oldPrice = "old_price"
//        case discount, image, name
//        case productDescription = "description"
    }
}


// MARK: - DeleteFromCartsResponse
struct DeleteFromCartsResponse: Codable {
    let status: Bool
    let message: String
    let data: DeletedCartItemInfo?
}

// MARK: - DeletedCartItemInfo
struct DeletedCartItemInfo: Codable {
    let cart: DeletedCartItem
    let subTotal, total: Int

    enum CodingKeys: String, CodingKey {
        case cart
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - DeletedCartItem
struct DeletedCartItem: Codable {
    let id, quantity: Int
    let product: DeleteCartProduct
}

// MARK: - DeleteCartProduct
struct DeleteCartProduct: Codable {
    let id, price, oldPrice, discount: Int
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image
    }
}
