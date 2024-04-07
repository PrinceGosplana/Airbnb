//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 07.04.2024.
//

import SwiftUI

struct ListingDetailView: View {
    var body: some View {
        ScrollView {
            ListingImageCarouselView()
                .frame(height: 320)

            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)

                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("4.84")

                        Text(" - ")

                        Text("25 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)

                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)

            Divider()

            // host info view
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)

                    HStack(spacing: 2) {
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("4 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)

                Spacer()

                Image(.femaleProfile)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                ForEach(0 ..< 2) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")

                        VStack(alignment: .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)

                            Text("Superhosts are experience, highly rated hosts, who are committed to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)

                        }

                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ListingDetailView()
}
