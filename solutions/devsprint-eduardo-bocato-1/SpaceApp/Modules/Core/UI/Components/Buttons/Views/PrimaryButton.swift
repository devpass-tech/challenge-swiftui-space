//
//  PrimaryButton.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 16/03/22.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: (() -> Void)

    init(_ title: String, action: @escaping (() -> Void)) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(title, action: action)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .font(NewDS.Typography.button.font)
            .foregroundColor(.white)
            .newDsBackgroundColor(.accentColor)
            .newDsCornerRadius(.small)
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
