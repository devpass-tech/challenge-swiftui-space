//
//  SPSystemIconsConstants.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

enum SPSystemIconsConstants: String {
    case locationNorthFill = "location.north.fill"
    case houseFill = "house.fill"
    
    var image: Image { .init(systemName: self.rawValue) }
}
