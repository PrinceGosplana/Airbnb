//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 07.04.2024.
//

import SwiftUI

struct ListingImageCarouselView: View {

    let listing: Listing

    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)

    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
