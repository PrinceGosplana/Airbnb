//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 08.04.2024.
//

import SwiftUI

struct DestinationSearchView: View {

    @Binding var show: Bool

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
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}
