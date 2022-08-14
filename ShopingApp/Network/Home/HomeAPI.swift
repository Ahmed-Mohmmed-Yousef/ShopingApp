//
//  HomeAPI.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import Foundation

protocol HomeAPIProtoco {
    func getHomeData(userToken: String?, completion: @escaping(Result<HomeDataResponse, APIError>) -> Void)
}

class HomeAPI: BaseAPI<HomeNetwork>, HomeAPIProtoco {
    static let shared: HomeAPIProtoco = HomeAPI()
    
    private override init() {}
    
    func getHomeData(userToken: String?, completion: @escaping (Result<HomeDataResponse, APIError>) -> Void) {
        self.fetchData(target: .getHomeData(userToken: userToken)) { result in
            switch result {
                
            case .success(let data):
                do {
                    let homeResponseData = try JSONDecoder().decode(HomeDataResponse.self, from: data)
                    completion(.success(homeResponseData))
                } catch {
                    completion(.failure(.jSONDecodingFailure))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
