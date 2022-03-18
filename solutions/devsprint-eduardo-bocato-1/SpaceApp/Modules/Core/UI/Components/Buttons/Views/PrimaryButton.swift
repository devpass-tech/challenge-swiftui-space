//
//  PrimaryButton.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 16/03/22.
//

import SwiftUI

struct PrimaryButton: View {
    // MARK: Constants
    private struct Constants {
        static var buttonHeight: CGFloat = 60
    }

    // MARK: Properties
    private let title: String
    private let action: (() -> Void)

    // MARK: Initializer
    init(_ title: String, action: @escaping (() -> Void)) {
        self.title = title
        self.action = action
    }

    // MARK: View
    var body: some View {
        Button(title, action: action)
            .frame(height: Constants.buttonHeight)
            .frame(maxWidth: .infinity)
            .dsTypography(.button)
            .foregroundColor(.white)
            .dsBackgroundColor(.accentColor)
            .dsCornerRadius(.small)
    }
}

#if DEBUG
struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrimaryButton("See more", action: {})
                .padding(5)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Light mode")

            PrimaryButton("See more", action: {})
                .padding(5)
                .previewLayout(.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")
        }
    }
}
#endif
