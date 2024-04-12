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
                ProfileLoginView(showLogin: $showLogin)
            } else {
                UserProfileHeaderView()
            }
            /// profile options
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)

            if authManager.userSessionId != nil {
                Button {
                    Task {
                        await authManager.signout()
                    }
                } label: {
                    Text("Log Out")
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .underline()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
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
