//
//  InfoRowView.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 24/01/22.
//

import Foundation
import SwiftUI

struct InfoRowView: View {

    var infoRowViewModel = InfoRowViewModel()

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
            CustomButton(
                text: "See more") {
                    print("pressed")
                }
        }
        .background(Color.black)
    }
}

struct CustomButton: View {

    var text: String
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.white)
        }
        .frame(width: 343, height: 56, alignment: .center)
        .background(Color.blue)
        .cornerRadius(14)
    }
}

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView()
    }
}
