//
//  RegistrationView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct RegistrationView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @StateObject var viewModel = RegistrationViewModel(service: MockAuthService())
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer()
            
            Image(.airbnbAppIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .modifier(PrimaryTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(PrimaryTextFieldModifier())

                TextField("Enter your full name", text: $fullName)
                    .modifier(PrimaryTextFieldModifier())
            }

            Button {
                Task {
                    await viewModel.createUser(
                        withEmail: email,
                        password: password,
                        fullName: fullName
                    )
                }
            } label: {
                Text("Create account")
                    .modifier(PrimaryButtonModifier())
            }
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.7)

            Spacer()

            Spacer()

            Button {
                dismiss()
            } label: {
                HStack(spacing: 2) {
                    Text("Already have an account?")

                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

// MARK: - AuthenticationFormProtocol


extension RegistrationView: AuthenticationFormProtocol {

    var formIsValid: Bool {
        email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5 &&
        !fullName.isEmpty
    }

}

#Preview {
    RegistrationView()
}
