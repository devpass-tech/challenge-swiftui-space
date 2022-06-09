//
//  HomeView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import SwiftUI

struct HomeView: View {

    @State var launches: [Launch] = []
    
    var body: some View {
        NavigationView {
            List(launches) { launch in
                Text("\(launch.name)")
            }
            .onAppear() {
                SpaceXAPI().fetchAllLaunches { launches in
                    self.launches = launches ?? []
                }
            }.navigationTitle("Space App 🚀")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
