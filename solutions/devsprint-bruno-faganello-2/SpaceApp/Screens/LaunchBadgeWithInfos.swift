//
//  LaunchBadgeWithInfos.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 03/05/22.
//

import SwiftUI

struct LaunchBadgeWithInfos: View {
    //MARK: - Properties
    var viewData: LaunchBadgeWithInfosViewData?
    
    //MARK: - Constructor
    
    init(viewData: LaunchBadgeWithInfosViewData?) {
        self.viewData = viewData
    }
    
    init(_ viewData: NextLaunchViewData?) {
        self.init(viewData: .init(
            iconImageURL: viewData?.iconImageURL,
            rocketName: viewData?.rocketName,
            launchNumber: viewData?.launchNumber,
            launchDate: viewData?.launchDate
        ))
    }
    
    //MARK: - View
    var body: some View {
        HStack(spacing: 16) {
            bagdeIconImage
            launchInformationsStack
        }
    }
    
    //MARK: - Helpers
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

struct LaunchBadgeWithInfos_Previews: PreviewProvider {
    static var previews: some View {
        LaunchBadgeWithInfos(viewData: .init(iconImageURL: URL(string: "https://images2.imgbox.com/02/51/7NLaBm8c_o.png"), rocketName: "Aleatorio", launchNumber: "#1234", launchDate: "September 12, 2023"))
    }
}
