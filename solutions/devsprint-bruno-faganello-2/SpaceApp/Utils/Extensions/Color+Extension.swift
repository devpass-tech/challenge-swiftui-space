//
//  Color+Extension.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

extension Color {
    static let blueSelected: Color = makeColor(red: 52, green: 120, blue: 246)
    static let grayUnselected: Color = makeColor(red: 113, green: 113, blue: 113)
    static let darkGray: Color = makeColor(red: 29, green: 29, blue: 29)
    
    //MARK: - Helpers
    private static func makeColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color {
        .init(red: red/255, green: green/255, blue: blue/255)
    }
}
