//
//  Notifications.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//

import Foundation

extension Notification.Name {
    
    static let newCredentials = Notification.Name("newCredentials")
    
    static let cart = Notification.Name("cart")
    
    static let favorite = Notification.Name("favorite")
    
}

class FireNotification {
    static func name(name: Notification.Name) {
        NotificationCenter.default.post(name: name, object: nil)
    }
}
