//
//  DetailsHeaderView.swift
//  SpaceApp
//
//  Created by Pedro Boga on 26/04/22.
//

import SwiftUI

struct DetailsHeaderView: View {
    var imageUrl: String
    var launchTitle: String
    var launchResult: String
    var launchDate: String
    
    var body: some View {
        VStack (spacing: 7) {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                } else {
                    ProgressView()
                }
            }
            Text(launchTitle)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(launchResult)
                .font(.title2)
                .foregroundColor(.gray)
            Text(launchDate)
                .font(.title2)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

struct DetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsHeaderView(
            imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/NASA_seal.svg/125px-NASA_seal.svg.png",
            launchTitle: "Placeholder-Title",
            launchResult: "Placeholder-Success",
            launchDate: "Placeholder-Date"
        )
    }
}
