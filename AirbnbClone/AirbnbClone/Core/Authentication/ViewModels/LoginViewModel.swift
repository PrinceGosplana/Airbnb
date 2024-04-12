//
//  LoginViewModel.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

final class LoginViewModel: ObservableObject {

    private let authManager: AuthManager

    init(authManager: AuthManager) {
        self.authManager = authManager
    }

    func login(withEmail email: String, password: String) async {
        do {
            try await authManager.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: failed to login with error \(error.localizedDescription)")
        }
    }
}
