//
//  HomeView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import SwiftUI

struct HomeView: View {

    @State var launches: [Launch] = []
    private let service: SpaceXAPIProtocol
    
    init(service: SpaceXAPIProtocol) {
        self.service = service
    }
    
    var body: some View {
        NavigationView {
            List(launches) { launch in
                Text("\(launch.name)")
            }
            .onAppear() {
                service.fetchAllLaunches { launchs in
                    self.launches = launchs ?? []
                }
            }
            .navigationTitle("Space App 🚀")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let service = SpaceXAPI()
        HomeView(service: service)
    }
}
