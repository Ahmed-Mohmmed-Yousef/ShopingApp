//
//  TargetType.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case update = "UPDATE"
}

enum Task {
    case requestPlain
    
    case requestParametr(parameter: [String: Any])
}

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String : String]? { get }
}
