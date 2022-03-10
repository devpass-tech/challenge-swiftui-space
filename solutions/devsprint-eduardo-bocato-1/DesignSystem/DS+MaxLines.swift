//
//  DS+Size.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 10/03/2022.
//

import CoreGraphics

extension DS {
    public struct MaxLines {
        let value: Int
    }
}

extension DS.MaxLines {
    public static let none: Self = .init(value: 0)
    public static let three: Self = .init(value: 3)
}
