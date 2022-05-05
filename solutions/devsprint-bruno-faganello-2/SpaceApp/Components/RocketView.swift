//
//  RocketView.swift
//  SpaceApp
//
//  Created by Tatiana Rico on 03/05/22.
//

import Foundation
import SwiftUI

struct RocketView: View {
    let titleRocket: String
    let detailRocket: String
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            Text("Rocket")
                .foregroundColor(.black)
                .font(.title)
                .padding()
            Text(titleRocket)
                .multilineTextAlignment(.leading)
                .padding()
            Text(detailRocket)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .padding()
            SPButtonView(colorText: .white, colorBtn: .blue, title: "See More") {
                action()
            }
        }
    }
}

