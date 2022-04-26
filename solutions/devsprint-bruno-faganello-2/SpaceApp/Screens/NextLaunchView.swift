//
//  NextLaunchView.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import SwiftUI

struct NextLaunchView: View {
    
    let viewData: NextLaunchViewData
    
    private var badgeURL: URL? { URL(string: viewData.badgeURLString) }
    
    var body: some View {
        ZStack {
            Color.black
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    AsyncImage(url: badgeURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(.circular)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        default:
                            Text("Failed fetching image. Make sure to check your data connection and try again.")
                        }
                    }
                    .frame(width: 125, height: 125)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewData.launchName)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                        Text(viewData.launchNumber)
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .regular))
                        
                        Text(viewData.launchDate)
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .regular))
                    }
                }
                
                Text(viewData.description)
                    .lineLimit(3)
                    .foregroundColor(.white)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

struct NextLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchView(viewData: .init())
    }
}
