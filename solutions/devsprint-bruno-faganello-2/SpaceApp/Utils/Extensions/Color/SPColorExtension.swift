//
//  SPColorExtension.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

struct SPColorExtension {
    
    var blueSelected: Color { makeColor(red: 52, green: 120, blue: 246) }
    var grayUnselected: Color { makeColor(red: 113, green: 113, blue: 113) }
    var darkGray: Color { makeColor(red: 29, green: 29, blue: 29) }
    
    let contentBlack: Color = .black
    
    //MARK: - Helpers
    private func makeColor(red: Double, green: Double, blue: Double) -> Color {
        .init(red: red/255, green: green/255, blue: blue/255)
    }
}
