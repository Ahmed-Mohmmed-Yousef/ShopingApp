//
//  CategoryNetwork.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//

import Foundation

enum CategoryNetwork {
    case getCategory
    case getCategorDetail(userToken: String, categoryId: Int)
}

extension CategoryNetwork: TargetType {
    var baseURL: String {
        ApiPath.baseURL
    }
    
    var path: String {
        switch self {
        case .getCategory:
            return ApiPath.CategoryApiConst.categories
        case .getCategorDetail(_, let categoryId):
            return ApiPath.CategoryApiConst.categories + "/\(categoryId)"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        var params: [String: String] = [:]
        params["lang"] = "en"
        switch self {
        case .getCategory:
            break
        case .getCategorDetail(let userToken, _):
            params["Authorization"] = userToken
        }
        return params
    }
    
    
}
