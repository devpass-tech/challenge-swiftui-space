//
//  DS+CornerRadius.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 10/03/2022.
//

import CoreGraphics

extension DS {
    public struct CornerRadius {
        let value: CGFloat
    }
}

extension DS.CornerRadius {
    public static let xxSmall: Self = .init(value: 8)
    public static let xSmall: Self = .init(value: 12)
    public static let small: Self = .init(value: 16)
}
