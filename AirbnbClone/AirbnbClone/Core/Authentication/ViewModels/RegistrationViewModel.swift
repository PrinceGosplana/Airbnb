//
//  RegistrationViewModel.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    
    private let service: MockAuthService

    init(service: MockAuthService) {
        self.service = service
    }

    func createUser(withEmail email: String, password: String, fullName: String) async {
        do {
            try await service.createUser(withEmail: email, password: password, fullName: fullName)
        } catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
}
