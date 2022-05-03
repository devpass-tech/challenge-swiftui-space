//
//  LaunchViewCell.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 03/05/22.
//

import SwiftUI

struct LaunchViewCell: View {
    
    //MARK: - Properties
    let viewData: LaunchBadgeWithInfosViewData?
    
    //MARK: - View
    var body: some View {
        ZStack {
            LaunchBadgeWithInfos(viewData: viewData)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(Color.darkGray)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

struct LaunchViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .frame(maxHeight: 200)
            LaunchViewCell(viewData: .init(iconImageURL: URL(string: "https://images2.imgbox.com/02/51/7NLaBm8c_o.png"), rocketName: "Aleatorio", launchNumber: "#1234", launchDate: "September 12, 2023"))
        }
        .previewLayout(.sizeThatFits)
    }
}
