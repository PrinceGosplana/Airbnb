//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 09.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authManager: AuthManager
    @State private var showLogin = false

    init(authManager: AuthManager) {
        self.authManager = authManager
    }

    var body: some View {
        VStack {

            if authManager.userSessionId == nil {
                /// profile login view
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Log in to start planning your next trip")
                    }

                    Button {
                        showLogin.toggle()
                    } label: {
                        Text("Log in")
                            .modifier(PrimaryButtonModifier())
                    }

                    HStack {
                        Text("Don't have an account?")

                        Text("Sign up")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .font(.caption)
                }

            } else {

            }
            /// profile options
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .sheet(isPresented: $showLogin) {
            LoginView(authManager: authManager)
        }
        .padding()
    }
}

#Preview {
    ProfileView(authManager: AuthManager(service: MockAuthService()))
}
