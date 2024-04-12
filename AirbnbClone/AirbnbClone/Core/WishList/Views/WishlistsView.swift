//
//  WishlistsView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 10.04.2024.
//

import SwiftUI

struct WishlistsView: View {

    @State private var showLogin = false

    @ObservedObject var authManager: AuthManager

    init(authManager: AuthManager) {
        self.authManager = authManager
    }

    var body: some View {
        NavigationStack {
            VStack {
                if authManager.userSessionId == nil {
                    WishlistLoginView(showLogin: $showLogin)
                } else {
                    WishlistEmptyStateView()
                }
            }
            .sheet(isPresented: $showLogin) {
                LoginView(authManager: authManager)
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistsView(authManager: AuthManager(service: MockAuthService()))
}
