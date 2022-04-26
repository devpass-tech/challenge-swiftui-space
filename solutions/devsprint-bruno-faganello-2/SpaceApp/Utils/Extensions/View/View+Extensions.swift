//
//  View+Extensions.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

extension View {
    var SP: SPViewExtension<Self> { SPViewExtension(support: self) }
}
