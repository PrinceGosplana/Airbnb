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
    @ObservedObject var viewModel: ExplorerViewModel

    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0


    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }

                Spacer()

                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()

            VStack(alignment: .leading) {

                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)

                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
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
            .frame(height: selectedOption == .location ? 120 : 64)
            .modifier(CollapsibleDestinationViewModifier())
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
                        DatePicker(
                            "From",
                            selection: $startDate,
                            in: Date()...Date().oneYearInFuture,
                            displayedComponents: .date
                        )

                        Divider()

                        DatePicker(
                            "To",
                            selection: $endDate,
                            in: Date()...Date().oneYearInFuture,
                            displayedComponents: .date
                        )
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
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation { selectedOption = .dates }
            }

            /// num guests view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)

                    Stepper {
                        Text("^[\(numGuests) Adult](inflect: true)")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }

                } else {
                    CollapsedPicker(title: "Who", description: "Add guests")
                        .onTapGesture {
                            selectedOption = .guests
                        }
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation { selectedOption = .guests }
            }

            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(
        show: .constant(false),
        viewModel: ExplorerViewModel(service: ExploreService())
    )
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
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
