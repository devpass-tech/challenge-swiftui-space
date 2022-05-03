//
//  LaunchView.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            ScrollView {
                //TODO: Remove mocked list when API are done
                ForEach(0..<10) { _ in
                    LaunchViewCell(
                        viewData: .init(iconImageURL: URL(string: "https://images2.imgbox.com/02/51/7NLaBm8c_o.png"), rocketName: "Aleatorio", launchNumber: "#1234", launchDate: "September 12, 2023"))
                }
            }
        }
    }
}

//MARK: - PreviewProvider
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            LaunchView()
        }
    }
}
