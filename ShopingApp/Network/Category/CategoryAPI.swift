//
//  CategoryAPI.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//

import Foundation

protocol CategoryAPIProtocol {
    func getCategories(completion: @escaping(Result<GetCategoryResponse, APIError>) -> Void)
    func getCategoryDetails(userToken: String, categoryId: Int, completion: @escaping(Result<GetCategoryDetailsResponse, APIError>) -> Void)
}

class CategoryAPI: BaseAPI<CategoryNetwork>, CategoryAPIProtocol {
    
    static let shared: CategoryAPIProtocol = CategoryAPI()
    
    private override init() {}
    
    func getCategories(completion: @escaping (Result<GetCategoryResponse, APIError>) -> Void) {
        self.fetchData(target: .getCategory) { result in
            switch result {
            case .success(let data):
                do {
                    let getCategoryResponse = try JSONDecoder().decode(GetCategoryResponse.self, from: data)
                    completion(.success(getCategoryResponse))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getCategoryDetails(userToken: String, categoryId: Int, completion: @escaping (Result<GetCategoryDetailsResponse, APIError>) -> Void) {
        self.fetchData(target: .getCategorDetail(userToken: userToken, categoryId: categoryId)) { result in
            switch result {
            case .success(let data):
                do {
                    let getCategoryDetailsResponse = try JSONDecoder().decode(GetCategoryDetailsResponse.self, from: data)
                    completion(.success(getCategoryDetailsResponse))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
