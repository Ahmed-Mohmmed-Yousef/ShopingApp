//
//  UserAPI.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//

import Foundation

protocol UserAPIProtocol {
    func login(email: String, password: String, completion: @escaping(Result<LoginResponse, APIError>) -> Void)
    func register(name: String, email: String, phone: String, password: String, image: String, completion: @escaping(Result<RegisterResponse, APIError>) -> Void)
    func getProfile(userToken: String, completion: @escaping(Result<GetProfileResponse, APIError>) -> Void)
}

class UserAPI: BaseAPI<UserNetwork>, UserAPIProtocol {
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, APIError>) -> Void) {
        self.fetchData(target: .login(email: email, password: password)) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func register(name: String, email: String, phone: String, password: String, image: String, completion: @escaping (Result<RegisterResponse, APIError>) -> Void) {
        self.fetchData(target: .register(name: name, email: email, password: password, phone: phone, image: image)) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProfile(userToken: String, completion: @escaping (Result<GetProfileResponse, APIError>) -> Void) {
        self.fetchData(target: .getProfile(userToken: userToken)) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(GetProfileResponse.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.jSONDecodingFailure))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static let shared: UserAPIProtocol = UserAPI()
    
    private override init() {}
    
    
}
