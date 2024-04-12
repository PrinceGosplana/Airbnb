//
//  ProfileLoginView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct ProfileLoginView: View {

    @Binding var showLogin: Bool

    var body: some View {
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
    }
}

#Preview {
    ProfileLoginView(showLogin: .constant(false))
}
