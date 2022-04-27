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
            .onAppear(perform: fetchAllLaunches)
            .navigationTitle("Space App 🚀")
        }
    }
    
    private func fetchAllLaunches() {
        Task {
            let result = await service.fetchAllLaunches()
            DispatchQueue.main.async { self.launches = result ?? [] }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let service = SpaceXAPI()
        HomeView(service: service)
    }
}
