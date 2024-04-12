//
//  AirbnbCloneApp.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 06.04.2024.
//

import SwiftUI

@main
struct AirbnbCloneApp: App {

    let authManager = AuthManager(service: MockAuthService())

    var body: some Scene {
        WindowGroup {
            MainTabView(authManager: authManager)
        }
    }
}
