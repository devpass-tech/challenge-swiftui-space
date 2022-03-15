//
//  DS.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 10/03/2022.
//

import SwiftUI
import CoreGraphics

public enum DS {}

public extension CGFloat {
    static func dsSpacing(_ spacing: DS.Spacing) -> Self { spacing.value }
    static func dsPadding(_ padding: DS.Padding) -> Self { padding.value }
    static func dsCornerRadius(_ cornerRadius: DS.CornerRadius) -> Self { cornerRadius.value }
}

public extension Color {
    static func ds(_ color: DS.Color) -> Self { color.value }
}
