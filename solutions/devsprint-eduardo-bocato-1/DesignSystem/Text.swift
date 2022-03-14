//
//  Text.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 13/03/2022.
//

import SwiftUI

extension Text {
    func dsTypography(_ typography: DS.Typography) -> some View {
        self.font(typography.font)
    }
    
    func dsTypography(
        _ typography: DS.Typography,
        color: DS.Color
    ) -> some View {
        self
            .font(typography.font)
            .lineLimit(typography.maxLines)
            .foregroundColor(.ds(color))
    }
}
