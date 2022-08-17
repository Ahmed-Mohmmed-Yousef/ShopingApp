//
//  UserNetwork.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//

import Foundation

enum UserNetwork {
    case login(email: String, password: String)
    case register(name: String, email: String, password: String, phone: String, image: String)
    case getProfile(userToken: String)
}

extension UserNetwork: TargetType {
    var baseURL: String {
        ApiPath.baseURL
    }
    
    var path: String {
        switch self {
        case .login:
            return ApiPath.UserApiConst.login
        case .register:
            return ApiPath.UserApiConst.register
        case .getProfile:
            return ApiPath.UserApiConst.profile
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .getProfile:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .login(email: let email, password: let password):
            return .requestParametr(parameter: ["email": email, "password": password])
        case .register(let name, email: let email, password: let password, phone: let phone, let image):
            return .requestParametr(parameter: [
                "name": name,
                "email": email,
                "phone": phone,
                "password": password,
                "image": image
            ])
        case .getProfile:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var params: [String: String] = [:]
        params["lang"] = "en"
        switch self {
        case .login, .register:
            return params
        case .getProfile(let userToken):
            params["Authorization"] = userToken
            return params
        }
    }
    
    
}
