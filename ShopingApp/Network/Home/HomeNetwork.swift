//
//  HomeNetwork.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import Foundation


enum HomeNetwork {
    case getHomeData(userToken: String?)
}

extension HomeNetwork: TargetType {
    var baseURL: String { ApiPath.baseURL }
    
    var path: String {
        return ApiPath.HomeApiConst.home
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .getHomeData(userToken: _):
            return .get
        }
    }
    
    var task: Task {
        switch self {
            
        case .getHomeData(userToken: _):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        case .getHomeData(userToken: let userToken):
            var params: [String: String] = [:]
            params["lang"] = "en"
            if let userToken = userToken {
                params["Authorization"] = userToken
            }
            return params
        }
    }
    
    
}
