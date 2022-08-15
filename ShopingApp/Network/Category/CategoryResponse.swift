//
//  CategoryResponse.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//

import Foundation

// MARK: - GetCategoryResponse
struct GetCategoryResponse: Codable {
    let status: Bool
    let message: String?
    let data: CategoryPage?
}

// MARK: - CategoryPage
struct CategoryPage: Codable {
    let currentPage: Int
    let data: [Category]
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

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let image: String
}

struct CategoryViewModel: ViewModelProtocol {
    let id: Int
    let name: String
    let image: String
    
    init(category: Category) {
        self.id = category.id
        self.name = category.name
        self.image = category.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: CategoryViewModel, rhs: CategoryViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}


// MARK: - GetCategoryDetailsResponse
struct GetCategoryDetailsResponse: Codable {
    let status: Bool
    let message: String?
    let data: CategoryProductsDetail?
}

// MARK: - DataClass
struct CategoryProductsDetail: Codable {
    let currentPage: Int
    let data: [Product]
    let from, lastPage: Int
    let path: String
    let perPage: Int
    let prevPageURL: String?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case from
        case lastPage = "last_page"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

