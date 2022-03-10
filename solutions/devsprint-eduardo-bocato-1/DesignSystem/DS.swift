//
//  DS.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 10/03/2022.
//

import CoreGraphics

public enum DS {}

public extension CGFloat {
    static func dsSpacing(_ spacing: DS.Spacing) -> Self { spacing.value }
    static func dsPadding(_ padding: DS.Padding) -> Self { padding.value }
    static func dsCornerRadius(_ cornerRadius: DS.CornerRadius) -> Self { cornerRadius.value }
}

public extension Int {
    static func dsMaxLines(_ lines: DS.MaxLines) -> Self { lines.value }
}
