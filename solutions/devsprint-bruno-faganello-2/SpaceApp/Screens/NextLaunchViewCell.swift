//
//  NextLaunchViewCell.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import SwiftUI

struct NextLaunchViewCell: View {
    
    //MARK: - Propeties
    let viewData: NextLaunchViewData?
    
    //MARK: - View
    var body: some View {
        VStack(spacing: 16) {
            headerSection
            
            VStack(spacing: 16) {
                LaunchBadgeWithInfos(viewData)
                
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
    
    //MARK: - Helper
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
}

//MARK: - PreviewProvider
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
