//
//  LocalInfo.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//

import Foundation

class LocalInfo {
    static let shared = LocalInfo()
    
    private init() {}
    
    private let defaults = UserDefaults.standard
    private let KCredentials = "Credentials"
    
    var credentials: Credentials? {
        if let data = defaults.object(forKey: KCredentials) as? Data {
            let decoder = JSONDecoder()
            if let cData = try? decoder.decode(Credentials.self, from: data) {
                return cData
            } else { return nil }
        } else { return nil }
    }
    
    func setLoginData(credentials: Credentials) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(credentials) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: KCredentials)
        }
    }
    
}
