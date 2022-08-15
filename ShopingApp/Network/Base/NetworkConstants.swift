//
//  NetworkConstants.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import Foundation

enum APIError: Error {
    case badURL
    case bodyFormatError
    case requestFailure(error: Error)
    case nodDataRecived
    case jSONDecodingFailure
    
    var description: String {
        switch self {
        case .badURL:
            return "Bad url format"
        case .bodyFormatError:
            return "Body data is wrong"
        case .requestFailure(let error):
            return error.localizedDescription
        case .nodDataRecived:
            return "No data recived"
        case .jSONDecodingFailure:
            return "JSON decoding error"
        }
    }
}


class ApiPath {
    static let baseURL: String = "https://student.valuxapps.com/api/"
    
    class HomeApiConst {
        static let home = "home"
    }
    
    class FavoritesApiConst {
        static let favorites = "favorites"
    }
    
    class CartsApiConst {
        static let carts = "carts"
    }
    
    class CategoryApiConst {
        static let categories = "categories"
    }
}
