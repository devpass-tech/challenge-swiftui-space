//
//  DS+Font.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 14/03/22.
//

import SwiftUI

extension DS {
    public struct Typography {
        let font: SwiftUI.Font
    }
}

extension DS.Typography {
    /// A font with the large title text style.
    public static let largeTitle: Self = .init(font: .largeTitle)

    /// A font with the title text style.
    public static let title: Self = .init(font: .title)

    /// A font with the headline text style.
    public static let headline: Self = .init(font: .headline)

    /// A font with the subheadline text style.
    public static let subheadline: Self = .init(font: .subheadline)

    /// A font with the body text style.
    public static let body: Self = .init(font: .body)

    /// A font with the callout text style.
    public static let callout: Self = .init(font: .callout)

    /// A font with the footnote text style.
    public static let footnote: Self = .init(font: .footnote)

    /// A font with the caption text style.
    public static let caption: Self = .init(font: .caption)

    /// Font of buttons
    public static let button: Self = .init(font: .system(size: 18, weight: .semibold))
}

public extension View {
    func dsTypography(_ font: DS.Typography) -> some View {
        self.font(font.font)
    }

    func dsTypography(_ font: DS.Typography, color: DS.Color) -> some View {
        self.font(font.font).dsForegroundColor(color)
    }
}
