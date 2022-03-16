//
//  DS+Colors.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 14/03/22.
//

import SwiftUI

extension NewDS {
    public struct Color {
        let color: SwiftUI.Color
    }

    public struct DynamicColor {
        @Environment(\.colorScheme) private var colorScheme

        let light: SwiftUI.Color
        let dark: SwiftUI.Color

        var dsColor: NewDS.Color {
            colorScheme == .light ? .init(color: light) : .init(color: dark)
        }
    }
}

extension NewDS.Color {
    /// The color to use for primary content.
    public static let primary: Self = .init(color: .primary)

    /// The color to use for secondary content.
    public static let secondary: Self = .init(color: .secondary)

    /// A color that reflects the accent color of the system or app.
    public static let accentColor: Self = .init(color: .accentColor)

    /// A color that reflects the background color of app (mainly white or almost white)
    public static var background: Self = {
        let adaptative = NewDS.DynamicColor(
            light: Color.white,
            dark: Color.gray.opacity(0.1)
        )
        return adaptative.dsColor
    }()
}

public extension Color {
    static func newDs(_ color: NewDS.Color) -> Self { color.color }
}

public extension View {
    func newDsForegroundColor(_ color: NewDS.Color) -> some View {
        self.foregroundColor(.newDs(color))
    }

    func newDsBackgroundColor(_ color: NewDS.Color) -> some View {
        self.background(color.color)
    }
}
