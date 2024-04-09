//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 08.04.2024.
//

import SwiftUI

enum DestinationSearchOptions {
    case location, dates, guests
}

struct DestinationSearchView: View {

    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()

    var body: some View {
        VStack {
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }

            VStack(alignment: .leading) {

                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)

                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(minHeight: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPicker(title: "Where", description: "Add destination")
                }

            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation { selectedOption = .location }
            }

            /// date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)

                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)

                        Divider()

                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPicker(title: "When", description: "Add dates")
                        .onTapGesture {
                            selectedOption = .dates
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 180 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation { selectedOption = .dates }
            }

            /// num guests view
            VStack {
                if selectedOption == .guests {
                    HStack {
                        Text("Show expanded view")

                        Spacer()
                    }
                } else {
                    CollapsedPicker(title: "Who", description: "Add guests")
                        .onTapGesture {
                            selectedOption = .guests
                        }
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation { selectedOption = .guests }
            }

        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsedPicker: View {
    let title: String
    let description: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
