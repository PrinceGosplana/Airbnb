//
//  ListingMapPreviewView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 11.04.2024.
//

import SwiftUI

struct ListingMapPreviewView: View {

    let listing: Listing

    var body: some View {
        VStack {
            TabView {
                ForEach(listing.imageURLs, id: \.self) { imageUrl in
                    Image(imageUrl)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Rectangle())
                }
            }
            .frame(height: 200)
            .tabViewStyle(.page)

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)

                    Text("7 nights: Dec 12 - 20")

                    HStack {
                        Text("$567")
                            .fontWeight(.semibold)

                        Text("hight")
                    }
                }

                Spacer()

                Text("\(listing.rating)")
            }
            .font(.footnote)
            .padding(8)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    ListingMapPreviewView(listing: DeveloperPreview.shared.listings[0])
}
