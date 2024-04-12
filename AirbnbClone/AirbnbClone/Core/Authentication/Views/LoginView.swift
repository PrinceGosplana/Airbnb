//
//  LoginView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel: LoginViewModel
    private let authManager: AuthManager
    @Environment(\.dismiss) private var dismiss

    init(authManager: AuthManager) {
        self.authManager = authManager
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authManager: authManager))
    }

    var body: some View {
        NavigationStack {
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
                }

                NavigationLink {

                } label: {
                    Text("Forgot passord?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Button {
                    Task {
                        await viewModel.login(
                            withEmail: email,
                            password: password
                        )
                        dismiss()
                    }
                } label: {
                    Text("Login")
                        .modifier(PrimaryButtonModifier())
                }
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)

                Spacer()

                Divider()

                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")

                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    
    var formIsValid: Bool {
        !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty
    }

}

#Preview {
    LoginView(authManager: AuthManager(service: MockAuthService()))
}
