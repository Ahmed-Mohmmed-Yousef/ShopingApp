//
//  FavoritesResponse.swift
//  ShopingApp
//
//  Created by Ahmed on 13/08/2022.
//

import Foundation

// MARK: - GetFavoriteRsponse
struct GetFavoriteRsponse: Codable {
    let status: Bool
    let message: String?
    let data: GetFavoriteRsponseData
}

// MARK: - GetFavoriteRsponseData
struct GetFavoriteRsponseData: Codable {
    let currentPage: Int
    let data: [FavoriteProductInfo]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let nextPageURL: String?
    let path: String
    let perPage: Int
    let prevPageURL: String?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - FavoriteProductInfo
struct FavoriteProductInfo: Codable {
    let id: Int
    let product: FavoriteProduct
}

// MARK: - FavoriteProduct
struct FavoriteProduct: Codable {
    let id, price, oldPrice, discount: Int
    let image: String
    let name, productDescription: String

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case productDescription = "description"
    }
}

// MARK: - AddOrDeleteFavoriteRsponse
struct AddOrDeleteFavoriteRsponse: Codable {
    let status: Bool
    let message: String
    let data: AddedOrDeletedProductInfo
}

// MARK: - AddedOrDeletedProductInfo
struct AddedOrDeletedProductInfo: Codable {
    let id: Int
    let product: AddedOrDeletedProduct
}

// MARK: - AddedOrDeletedProduct
struct AddedOrDeletedProduct: Codable {
    let id, price, oldPrice, discount: Int
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image
    }
}


// MARK: - DeleteFavoriteRsponse
struct DeleteFavoriteRsponse: Codable {
    let status: Bool
    let message: String
    let data: DeletedProductInfo
}

// MARK: - DeletedProductInfo
struct DeletedProductInfo: Codable {
    let id: Int
    let product: DeletedProduct
}

// MARK: - DeletedProduct
struct DeletedProduct: Codable {
    let id, price, oldPrice, discount: Int
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image
    }
}
