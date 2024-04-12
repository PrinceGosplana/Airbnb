//
//  AuthManager.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

final class AuthManager: ObservableObject {

    @Published var userSessionId: String?

    private let service: MockAuthService

    init(service: MockAuthService) {
        self.service = service

        userSessionId = "12345"
    }

    @MainActor
    func login(withEmail email: String, password: String) async throws {
        userSessionId = try await service.login(
            withEmail: email,
            password: password
        )
    }

    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        userSessionId = try await service.createUser(
            withEmail: email,
            password: password,
            fullName: fullName
        )
    }

    @MainActor
    func signout() async {
        await service.signout()
        userSessionId = nil
    }
}



