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
            Color.black
                .ignoresSafeArea(.all)
            
            Text("Launch View")
                .foregroundColor(.white)
        }
    }
}

//MARK: - PreviewProvider
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
