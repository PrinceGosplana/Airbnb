//
//  PrimaryTextFieldModifier.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 12.04.2024.
//

import SwiftUI

struct PrimaryTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
