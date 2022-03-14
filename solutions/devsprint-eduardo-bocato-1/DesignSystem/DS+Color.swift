//
//  DS+Color.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 13/03/2022.
//

import SwiftUI

extension DS {
    public struct Color {
        let value: SwiftUI.Color
    }
}

extension DS.Color {
    public static let black: Self = .init(value: .init(red: 255, green: 255, blue: 255))
}
