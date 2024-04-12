//
//  WishlistEmptyStateView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct WishlistEmptyStateView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Create yuour first wishlist")
                .font(.headline)

            Text("As you explore, tap the heart icon to save your favorite places to a wishlist")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    WishlistEmptyStateView()
}
