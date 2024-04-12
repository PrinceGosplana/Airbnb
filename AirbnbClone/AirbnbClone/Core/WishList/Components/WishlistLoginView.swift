//
//  WishlistlLoginView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct WishlistLoginView: View {

    @Binding var showLogin: Bool

    var body: some View {
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
    }
}

#Preview {
    WishlistLoginView(showLogin: .constant(false))
}
