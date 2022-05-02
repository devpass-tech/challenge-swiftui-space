//
//  NextLaunchViewCell.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import SwiftUI

struct NextLaunchViewCell: View {
    
    let viewData: NextLaunchViewData
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Upcoming")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    bagdeIconImage
                    launchInformationsStack
                }
                
                Text(viewData.description)
                    .lineLimit(3)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.gray)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color(red: 25/255, green: 25/255, blue: 25/255))
            .cornerRadius(10)
        }
    }
    
    private var bagdeIconImage: some View {
        AsyncImage(url: viewData.badgeURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: 125, height: 125)
                    .tint(.white)
                
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 125, height: 125)
                    .aspectRatio(contentMode: .fit)
            default:
                Text("Failed fetching image. Make sure to check your data connection and try again.")
            }
        }
    }
    
    private var launchInformationsStack: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewData.launchName)
                .font(.system(size: 24, weight: .semibold))
            
            Text(viewData.launchNumber)
                .font(.system(size: 20, weight: .regular))
            
            Text(viewData.launchDate)
                .font(.system(size: 20, weight: .regular))
        }
        .foregroundColor(.gray)
    }
}

struct NextLaunchViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchViewCell(viewData: .init())
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
        .previewDisplayName("Default preview")
        .background(Color.black)
    }
}
