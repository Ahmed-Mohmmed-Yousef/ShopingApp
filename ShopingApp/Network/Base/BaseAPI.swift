//
//  BaseAPI.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    func fetchDataX(target: T, completion: @escaping(Result<Data, APIError>) -> Void) {
        let urlString = target.baseURL + target.path
        let method = target.method
        let headers = target.headers ?? [:]
        var params: [String: Any] = [:]
        switch target.task {
            
        case .requestPlain:
            params = [:]
        case .requestParametr(parameter: let parameter):
            params = parameter
        }
        
        guard let url = URL(string: urlString) else { completion(.failure(.badURL)); return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        if method == .post {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
                completion(.failure(.bodyFormatError))
                return
            }
            request.httpBody = httpBody
        }
        print(urlString)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailure(error: error)))
            } else {
                if let data = data {
                    if let string = String(data: data, encoding: .utf8) {
                        print(string)
                    }
                    completion(.success(data))
                } else {
                    completion(.failure(.nodDataRecived))
                }
            }
            
            }.resume()
    }
    
    func fetchData(target: T, completion: @escaping(Result<Data, APIError>) -> Void) {
        let urlString = target.baseURL + target.path
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        var params: [String: Any]? = [:]
        switch target.task {
            
        case .requestPlain:
            params = nil
        case .requestParametr(parameter: let parameter):
            params = parameter
        }
        print(urlString)
        
        AF.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseData { resp in
            switch resp.result {
                
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(.requestFailure(error: error)))
            }
        }
    }
}

