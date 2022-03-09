//
//  LaunchDetailsBodyView.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 08/03/2022.
//

import SwiftUI

struct LaunchDetailsBodyView: View {
    struct Model {
        let title: String
        let description: String
        let buttonTitle: String
    }
    
    let model: Model
    let buttonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(model.title)
                .font(.title2)
                .bold()
                .frame(alignment: .leading)
            
            Text(model.description)
                .lineLimit(3)

            Button {
                buttonAction()
            } label: {
                Text(model.buttonTitle)
                    .bold()
                    .frame(minWidth: .zero, maxWidth: .infinity)
            }.buttonStyle(SpaceButtonStyle())
        }
        .padding(15)
    }
}

#if DEBUG
extension LaunchDetailsBodyView.Model {
    static func fixture (
        title: String = "Details",
        description: String = "SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission...",
        buttonTitle: String = "See more"
    ) -> Self {
        .init(
            title: title,
            description: description,
            buttonTitle: buttonTitle
        )
    }
}
#endif

#if DEBUG
struct LaunchDetailsBodyView_Previews: PreviewProvider {
    static var previews: some View {
        let action = {
            print("Button Pressed")
        }
        LaunchDetailsBodyView(model: .fixture(), buttonAction: action)
            .preferredColorScheme(.light)
        LaunchDetailsBodyView(model: .fixture(), buttonAction: action)
            .preferredColorScheme(.dark)
    }
}
#endif
