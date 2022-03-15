//
//  DS+Spacing.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 10/03/2022.
//

import CoreGraphics

extension DS {
    public struct Spacing {
        let value: CGFloat
    }
}

extension DS.Spacing {
    public static let micro: Self = .init(value: 2)
    public static let tiny: Self = .init(value: 4)
    public static let xSmall: Self = .init(value: 12)
    public static let small: Self = .init(value: 16)
}
