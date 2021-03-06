//
//  DS+Spacing.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 14/03/22.
//

import SwiftUI
import CoreGraphics

extension DS {
    public struct Spacing {
        let value: CGFloat
    }
}

extension DS.Spacing {
    /// 0 px
    public static let none: Self = .init(value: 0)
    /// 2 px
    public static let micro: Self = .init(value: 2)
    /// 4 px
    public static let tiny: Self = .init(value: 4)
    /// 8 px
    public static let xxSmall: Self = .init(value: 8)
    /// 12 px
    public static let xSmall: Self = .init(value: 12)
    /// 16px
    public static let small: Self = .init(value: 16)
    /// 24 px
    public static let medium: Self = .init(value: 24)
    /// 32 px
    public static let large: Self = .init(value: 32)
    /// 48 px
    public static let xLarge: Self = .init(value: 48)
    /// 64 px
    public static let xxLarge: Self = .init(value: 64)
}

public extension CGFloat {
    static func dsSpacing(_ spacing: DS.Spacing) -> Self { spacing.value }
}

public extension View {
    func dsPadding(_ spacing: DS.Spacing) -> some View {
        self.padding(.dsSpacing(spacing))
    }
}
