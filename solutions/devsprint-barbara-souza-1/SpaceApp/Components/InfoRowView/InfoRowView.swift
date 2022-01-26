//
//  InfoRowView.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 24/01/22.
//

import SwiftUI

struct InfoRowView: View {

    var infoRowViewModel: InfoRowViewModel
    var action: () -> Void

    init(infoRowViewModel: InfoRowViewModel, action: @escaping (() -> Void)) {
        self.infoRowViewModel = infoRowViewModel
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(infoRowViewModel.title)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .semibold))
            if infoRowViewModel.subtitle != nil {
                Text(infoRowViewModel.subtitle ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size: 20, weight: .regular))
            }
            Text(infoRowViewModel.description)
                .foregroundColor(.gray)
                .font(.system(size: 20, weight: .regular))
                .lineLimit(3)
            Button(action: action) {
                Text(infoRowViewModel.buttonText)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity,  maxHeight: 56)
            .background(Color.blue)
            .cornerRadius(14)
        }
        .background(Color.black)
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

