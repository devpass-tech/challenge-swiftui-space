//
//  SPViewExtension.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

struct SPViewExtension<V: View> {
    
    let support: V
    
    var asAnyView: AnyView { .init(support) }
}
