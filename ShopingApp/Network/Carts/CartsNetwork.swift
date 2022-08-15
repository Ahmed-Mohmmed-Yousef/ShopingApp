//
//  CartsNetwork.swift
//  ShopingApp
//
//  Created by Ahmed on 13/08/2022.
//

import Foundation

enum CartsNetwork {
    case getCarts(userToken: String)
    case addOrDeleteCart(userToken: String, productId: Int)
    case deleteFromCart(userToken: String, productId: Int)
    case updateCart(userToken: String, productId: Int, quantity: Int)
}

extension CartsNetwork: TargetType {
    var baseURL: String {
        ApiPath.baseURL
    }
    
    var path: String {
        switch self {
        case .deleteFromCart(_, let id):
            return ApiPath.CartsApiConst.carts + "/\(id)"
        case .updateCart(_, let productId, _):
            return ApiPath.CartsApiConst.carts + "/\(productId)"
        default:
            return ApiPath.CartsApiConst.carts
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .getCarts:
            return .get
        case .addOrDeleteCart:
            return .post
        case .deleteFromCart:
            return .delete
        case .updateCart:
            return .put
        }
    }
    
    var task: Task {
        switch self {
        case .getCarts:
            return .requestPlain
        case .addOrDeleteCart(_, productId: let productId):
            return .requestParametr(parameter: ["product_id": productId])
        case .deleteFromCart:
            return .requestPlain
        case .updateCart(_, _, let quantity):
            return .requestParametr(parameter: ["quantity": quantity])
        }
    }
    
    var headers: [String : String]? {
        var params: [String: String] = [:]
        params["lang"] = "en"
        switch self {
        case .getCarts(userToken: let userToken):
            params["Authorization"] = userToken
        case .addOrDeleteCart(userToken: let userToken, _):
            params["Authorization"] = userToken
        case .deleteFromCart(userToken: let userToken, _):
            params["Authorization"] = userToken
        case .updateCart(let userToken, _, _):
            params["Authorization"] = userToken
        }
        return params
    }
    
    
}
