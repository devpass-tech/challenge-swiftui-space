//
//  NextLaunchViewCell.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import SwiftUI

struct NextLaunchViewCell: View {
    
    let viewData: NextLaunchViewData?
    
    var body: some View {
        VStack(spacing: 16) {
            headerSection
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    bagdeIconImage
                    launchInformationsStack
                }
                
                Text(viewData?.description ?? .emptyString)
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
    
    private var headerSection: some View {
        HStack {
            Text("Upcoming")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.top, 20)
    }
    
    private var bagdeIconImage: some View {
        AsyncImage(url: viewData?.iconImageURL) { phase in
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
    
    @ViewBuilder private var launchInformationsStack: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewData?.rocketName ?? .emptyString)
                .font(.system(size: 24, weight: .semibold))
            
            Text(viewData?.launchNumber ?? .emptyString)
                .font(.system(size: 20, weight: .regular))
            
            Text(viewData?.launchDate ?? .emptyString)
                .font(.system(size: 20, weight: .regular))
        }
        .foregroundColor(.gray)
    }
}

struct NextLaunchViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            NextLaunchViewCell(viewData: .init(nextLaunchResponse: .init(links: .init(patch: .init(small: "https://images2.imgbox.com/02/51/7NLaBm8c_o.png")), detail: "kasjhfklasjhfkasfjdkasjhfklasjhfkasfjdkasjhfklasjhfkasfjdkasjhfklasjhfkasfjd", flightNumber: 234, aircraftName: "Tester", launchDate: "September 12, 2023", id: "23wq"))
            )
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
        .previewDisplayName("Default preview")
        .background(Color.black)
    }
}
