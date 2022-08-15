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

// MARK: - CartData
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
    let id: Int
    var quantity: Int
    let product: CartProduct
    
    mutating func updateQuantity(value: Int) {
        quantity = value
    }
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


struct CartItemViewModel: ViewModelProtocol {
    let id, quantity: Int
    private let price, oldPrice: Int
    let name, image: String
    var priceString: String { Double(price).stringPrice + " EGP"}
    var oldPriceString: String? { return oldPrice == price ? nil : Double(oldPrice).stringPrice + " EGP"}
    
    init(cartItem: CartItem) {
        self.id = cartItem.id
        self.quantity = cartItem.quantity
        self.price = cartItem.product.price
        self.oldPrice = cartItem.product.oldPrice
        self.name = cartItem.product.name
        self.image = cartItem.product.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: CartItemViewModel, rhs: CartItemViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

struct CartProductViewModel: ViewModelProtocol {
    let id, price, oldPrice, discount: Int
    let image: String
    let name, productDescription: String
    let images: [String]
    let inFavorites, inCart: Bool
    
    init(cartProduct: CartProduct) {
        self.id = cartProduct.id
        self.price = cartProduct.price
        self.oldPrice = cartProduct.oldPrice
        self.discount = cartProduct.discount
        self.image = cartProduct.image
        self.name = cartProduct.name
        self.productDescription = cartProduct.productDescription
        self.images = cartProduct.images
        self.inFavorites = cartProduct.inFavorites
        self.inCart = cartProduct.inCart
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: CartProductViewModel, rhs: CartProductViewModel) -> Bool {
        lhs.id == rhs.id
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


// MARK: - UpdateCardItemResponse
struct UpdateCardItemResponse: Codable {
    let status: Bool
    let message: String
    let data: UpdateCardInfo?
}

// MARK: - UpdateCardInfo
struct UpdateCardInfo: Codable {
    let cart: UpdatedCardItem
    let subTotal, total: Int

    enum CodingKeys: String, CodingKey {
        case cart
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - UpdatedCardItem
struct UpdatedCardItem: Codable {
    let id, quantity: Int
    let product: UpdatedCardProduct
}

// MARK: - UpdatedCardProduct
struct UpdatedCardProduct: Codable {
    let id: Int
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
