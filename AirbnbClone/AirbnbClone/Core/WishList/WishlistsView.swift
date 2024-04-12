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
                    VStack(alignment: .leading, spacing: 32) {

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Log in to view your wishlists")
                                .font(.headline)

                            Text("You can create, view or edit wishlists once you're logged in")
                                .font(.footnote)

                        }
                        Button {
                            showLogin.toggle()
                        } label: {
                            Text("Log in")
                                .modifier(PrimaryButtonModifier())
                        }

                        Spacer()
                    }
                } else {
                    Text("Logged")
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
