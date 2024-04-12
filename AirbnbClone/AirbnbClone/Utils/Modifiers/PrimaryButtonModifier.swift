//
//  PrimaryButtonModifier.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 360, height: 48)
            .background(Color(.systemPink))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
