//
//  FavoritesNetwork.swift
//  ShopingApp
//
//  Created by Ahmed on 13/08/2022.
//

import Foundation

enum FavoritesNetwork {
    case getFavorites(String)
    case addOrDeleteFavorite(String, Int)
    case deleteFavorite(String, Int)
}

extension FavoritesNetwork: TargetType {
    var baseURL: String {
        ApiPath.baseURL
    }
    
    var path: String {
        switch self {
        case .deleteFavorite(_, let id):
            return ApiPath.FavoritesApiConst.favorites + "/\(id)"
        default:
            return ApiPath.FavoritesApiConst.favorites
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getFavorites:
            return .get
        case .addOrDeleteFavorite:
            return .post
        case .deleteFavorite:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .getFavorites:
            return .requestPlain
        case .addOrDeleteFavorite(_, let id):
            return .requestParametr(parameter: ["product_id": id])
        case .deleteFavorite:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var params: [String: String] = [:]
        params["lang"] = "en"
        switch self {
        case .getFavorites(let userToken):
            params["Authorization"] = userToken
        case .addOrDeleteFavorite(let userToken, _):
            params["Authorization"] = userToken
        case .deleteFavorite(let userToken, _):
            params["Authorization"] = userToken
        }
        return params
    }
    
    
}
