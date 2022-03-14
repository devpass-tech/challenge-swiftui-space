//
//  DS+Colors.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 14/03/22.
//

import SwiftUI

extension DS {
    public struct Color {
        let color: SwiftUI.Color
    }

    public struct DynamicColor {
        @Environment(\.colorScheme) private var colorScheme

        let light: SwiftUI.Color
        let dark: SwiftUI.Color

        var dsColor: DS.Color {
            colorScheme == .light ? .init(color: light) : .init(color: dark)
        }
    }
}

extension DS.Color {
    /// A white color suitable for use in UI elements.
    @available(*, deprecated, message: "Check if you should use primary, secondary, background or accentColor")
    public static let white: Self = .init(color: .white)

    /// A blue color suitable for use in UI elements.
    @available(*, deprecated, message: "Check if you should use primary, secondary, background or accentColor")
    public static let blue: Self = .init(color: .blue)

    /// The color to use for primary content.
    public static let primary: Self = .init(color: .primary)

    /// The color to use for secondary content.
    public static let secondary: Self = .init(color: .secondary)

    /// A color that reflects the accent color of the system or app.
    public static let accentColor: Self = .init(color: .accentColor)

    /// A color that reflects the background color of app (mainly white or almost white)
    public static var background: Self = {
        let dynamic = DS.DynamicColor(
            light: Color.white,
            dark: Color.gray.opacity(0.1)
        )
        return dynamic.dsColor
    }()
}

public extension Color {
    static func ds(_ color: DS.Color) -> Self { color.color }
}

public extension View {
    func dsForegroundColor(_ color: DS.Color) -> some View {
        self.foregroundColor(.ds(color))
    }

    func dsBackgroundColor(_ color: DS.Color) -> some View {
        self.background(color.color)
    }
}
