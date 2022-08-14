//
//  FavoritesAPI.swift
//  ShopingApp
//
//  Created by Ahmed on 13/08/2022.
//

import Foundation

protocol FavoritesAPIProtocol {
    func getFavorites(userToken: String, completion: @escaping(Result<GetFavoriteRsponse, APIError>) -> Void)
    func addOrDeleteFavorite(userToken: String, with productId: Int, completion: @escaping(Result<AddOrDeleteFavoriteRsponse, APIError>) -> Void)
    func deleteFavorites(userToken: String, favoriteId: Int, completion: @escaping(Result<DeleteFavoriteRsponse, APIError>) -> Void)
}

class FavoritesAPI: BaseAPI<FavoritesNetwork>, FavoritesAPIProtocol {
    static let shared: FavoritesAPIProtocol = FavoritesAPI()
    
    private override init() {}
    
    func getFavorites(userToken: String, completion: @escaping (Result<GetFavoriteRsponse, APIError>) -> Void) {
        self.fetchData(target:  .getFavorites(userToken)) { result in
            switch result {
            case .success(let data):
                do {
                    let getFavoriteRsponse = try JSONDecoder().decode(GetFavoriteRsponse.self, from: data)
                    completion(.success(getFavoriteRsponse))
                } catch {
                    completion(.failure(.jSONDecodingFailure))
                }
            case .failure(let error):
                completion(.failure(.requestFailure(error: error)))
            }
        }
    }
    
    func addOrDeleteFavorite(userToken: String, with productId: Int, completion: @escaping (Result<AddOrDeleteFavoriteRsponse, APIError>) -> Void) {
        self.fetchData(target: .addOrDeleteFavorite(userToken, productId)) { result in
            switch result {
            case .success(let data):
                do {
                    let addOrDeleteFavoriteRsponse = try JSONDecoder().decode(AddOrDeleteFavoriteRsponse.self, from: data)
                    completion(.success(addOrDeleteFavoriteRsponse))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(.requestFailure(error: error)))
            }
        }
    }
    
    func deleteFavorites(userToken: String, favoriteId: Int, completion: @escaping (Result<DeleteFavoriteRsponse, APIError>) -> Void) {
        self.fetchData(target: .deleteFavorite(userToken, favoriteId)) { result in
            switch result {
            case .success(let data):
                do {
                    let deleteFavoriteRsponse = try JSONDecoder().decode(DeleteFavoriteRsponse.self, from: data)
                    completion(.success(deleteFavoriteRsponse))
                } catch {
                    completion(.failure(.jSONDecodingFailure))
                }
            case .failure(let error):
                completion(.failure(.requestFailure(error: error)))
            }
        }
    }
    
    
    
    
}
