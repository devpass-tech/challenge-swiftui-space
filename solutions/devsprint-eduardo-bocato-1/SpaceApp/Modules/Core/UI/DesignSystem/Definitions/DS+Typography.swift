//
//  DS+Size.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 10/03/2022.
//

import CoreGraphics
import SwiftUI

extension DS {
    public struct Typography {
        let font: Font
        let maxLines: Int
    }
}

extension DS.Typography {
    public static let descriptionLabel: Self = .init(font: .body, maxLines: 3)
}
