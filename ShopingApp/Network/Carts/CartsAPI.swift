//
//  CartsAPI.swift
//  ShopingApp
//
//  Created by Ahmed on 13/08/2022.
//

import Foundation

protocol CartsAPIProtocol {
    func getCarts(userToken: String, completion: @escaping(Result<GetCartsResponse, APIError>) -> Void)
    func addOrDeleteWithCarts(userToken: String, productId: Int, completion: @escaping(Result<AddOrDeleteWithCartsResponse, APIError>) -> Void)
    func deleteFromCarts(userToken: String, productId: Int, completion: @escaping(Result<DeleteFromCartsResponse, APIError>) -> Void)
}

class CartsAPI: BaseAPI<CartsNetwork>, CartsAPIProtocol {
    
    static let shared: CartsAPIProtocol = CartsAPI()
    
    private override init() {}
    
    func getCarts(userToken: String, completion: @escaping (Result<GetCartsResponse, APIError>) -> Void) {
        self.fetchData(target: .getCarts(userToken: userToken)) { result in
            switch result {
            case .success(let data):
                do {
                    let getCartsResponse = try JSONDecoder().decode(GetCartsResponse.self, from: data)
                    completion(.success(getCartsResponse))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func addOrDeleteWithCarts(userToken: String, productId: Int, completion: @escaping (Result<AddOrDeleteWithCartsResponse, APIError>) -> Void) {
        self.fetchData(target: .addOrDeleteCart(userToken: userToken, productId: productId)) { result in
            switch result {
            case .success(let data):
                do {
                    let addOrDeleteWithCartsResponse = try JSONDecoder().decode(AddOrDeleteWithCartsResponse.self, from: data)
                    completion(.success(addOrDeleteWithCartsResponse))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteFromCarts(userToken: String, productId: Int, completion: @escaping (Result<DeleteFromCartsResponse, APIError>) -> Void) {
        self.fetchData(target: .deleteFromCart(userToken: userToken, productId: productId)) { result in
            switch result {
            case .success(let data):
                do {
                    let deleteFromCartsResponse = try JSONDecoder().decode(DeleteFromCartsResponse.self, from: data)
                    completion(.success(deleteFromCartsResponse))
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
