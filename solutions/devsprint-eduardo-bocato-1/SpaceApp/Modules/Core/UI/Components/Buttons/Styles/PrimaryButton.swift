//
//  PrimaryButton.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 16/03/22.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .font(NewDS.Typography.button.font)
            .foregroundColor(.white)
            .newDsBackgroundColor(.accentColor)
            .newDsCornerRadius(.small)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
    }
}

extension Button {
    func primaryButtonStyle() -> some View {
        self.buttonStyle(PrimaryButtonStyle())
    }
}

#if DEBUG
struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("See more", action: {})
                .primaryButtonStyle()
                .padding(5)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Light mode")

            Button("See more", action: {})
                .primaryButtonStyle()
                .padding(5)
                .previewLayout(.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")
        }
    }
}
#endif
