//
//  UserResponse.swift
//  ShopingApp
//
//  Created by Ahmed on 16/08/2022.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let status: Bool
    let message: String
    let data: LoginData?
}

// MARK: - LoginData
struct LoginData: Codable {
    let id: Int
    let name, email, phone: String
    let image: String
    let points, credit: Int
    let token: String
}

// MARK: - RegisterResponse
struct RegisterResponse: Codable {
    let status: Bool
    let message: String
    let data: RegisterData?
}

// MARK: - Credentials
struct RegisterData: Codable {
    let name, phone, email: String
    let id: Int
    let image: String
    let token: String
}


// MARK: - GetProfileResponse
struct GetProfileResponse: Codable {
    let status: Bool
    let message: String?
    let data: ProfileData?
}

// MARK: - ProfileData
struct ProfileData: Codable {
    let id: Int
    let name, email, phone: String
    let image: String
    let points, credit: Int
    let token: String
}

struct Credentials: Codable {
    let name, email, phone, image, token: String
    
    init(loginData: LoginData) {
        self.name = loginData.name
        self.email = loginData.email
        self.phone = loginData.phone
        self.image = loginData.image
        self.token = loginData.token
    }
    
    init(registerData: RegisterData)  {
        self.name = registerData.name
        self.email = registerData.email
        self.image = registerData.image
        self.phone = registerData.phone
        self.token = registerData.token
    }
}
