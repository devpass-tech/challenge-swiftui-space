//
//  SpaceButtonStyle.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 10/03/2022.
//

import SwiftUI

struct SpaceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(.dsCornerRadius(.small))
    }
}
