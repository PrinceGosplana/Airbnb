//
//  MockAuthService.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import Foundation

actor MockAuthService {

    func login(withEmail email: String, password: String) async throws -> String? {
        NSUUID().uuidString
    }

    func createUser(withEmail email: String, password: String, fullName: String) async throws -> String? {
        NSUUID().uuidString
    }

    func signout() {
        
    }
}
