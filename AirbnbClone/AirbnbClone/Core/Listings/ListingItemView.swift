//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 06.04.2024.
//

import SwiftUI

struct ListingItemView: View {

    let listing: Listing

    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.city) \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)

                    Text("12 mi away")
                        .foregroundStyle(.gray)

                    Text("Nov 3-10")
                        .foregroundStyle(.gray)

                    HStack(spacing: 4) {
                        Text("$576")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }

                Spacer()

                // rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")

                    Text("4.86")
                }
                .foregroundStyle(.black)

            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
