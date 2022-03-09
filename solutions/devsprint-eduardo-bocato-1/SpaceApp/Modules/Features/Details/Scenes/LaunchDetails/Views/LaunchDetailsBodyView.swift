//
//  LaunchDetailsBodyView.swift
//  SpaceApp
//
//  Created by Razee Hussein-Jamal on 08/03/2022.
//

import SwiftUI

struct LaunchDetailsBodyView: View {
    let title: String
    let description: String
    let buttonTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
                .bold()
                .frame(alignment: .leading)
            
            Text(description)

            Button {
                
            } label: {
                Text(buttonTitle)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
            }.buttonStyle(SpaceButtonStyle())
        }
        .padding(15)
    }
}

struct SpaceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}

struct LaunchDetailsBodyView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsBodyView(title: "Details", description: "SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission...", buttonTitle: "See more")
    }
}
