//
//  InfoRowView.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 24/01/22.
//

import SwiftUI

struct InfoRowView: View {

    var infoRowViewModel: InfoRowViewModelRepresentable
    var action: () -> Void

    init(infoRowViewModel: InfoRowViewModelRepresentable, action: @escaping (() -> Void)) {
        self.infoRowViewModel = infoRowViewModel
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(infoRowViewModel.title)
                .foregroundColor(.titleColorWhite)
                .font(.system(size: 24, weight: .semibold))
            infoRowViewModel.subtitle.map(Text.init)
                .foregroundColor(.descriptionColorGray)
                .font(.system(size: 20, weight: .regular))
            Text(infoRowViewModel.description)
                .foregroundColor(.descriptionColorGray)
                .font(.system(size: 20, weight: .regular))
                .lineLimit(3)
            Button(action: action) {
                Text(infoRowViewModel.buttonText)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.titleColorWhite)
            }
            .frame(maxWidth: .infinity,  maxHeight: 56)
            .background(Color.buttonColorBlue)
            .cornerRadius(14)
        }
        .background(Color.backgroundColorBlack)
    }
}


extension InfoRowViewModel {
    static let mock = Self(
        title: "Rocket",
        subtitle: "Falcon Heavy (SpaceX)",
        description: "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded...",
        buttonText: "See more")
}

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(infoRowViewModel: InfoRowViewModel(), action: {})
            .padding()
            .preferredColorScheme(.dark)
    }
}

