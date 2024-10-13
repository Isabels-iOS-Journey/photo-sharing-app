//
//  UserRepository.swift
//  photo-sharing-app
//
//  Created by Isabel Quijada on 19.09.24.
//

import Foundation

struct UserRepository{
    //Lista de usuarios ya registrados
    private let registeredUsers = [
    UserModel(email: "test@example.com", password: "password123"),
    UserModel(email: "test1@example.com", password: "password123")
    ]
    
    func isValidUser(email: String, password: String) -> Bool {
        return registeredUsers.contains {user in user.email == email && user.password == password}
    }
}
