//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 10.04.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }

            WishlistsView()
                .tabItem { Label("Wishlists", systemImage: "heart") }

            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle.fill") }
        }
    }
}

#Preview {
    MainTabView()
}
