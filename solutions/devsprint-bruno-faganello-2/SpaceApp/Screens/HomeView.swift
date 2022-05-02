//
//  HomeView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {

            List(viewModel.launchs) { launch in
                Text("\(launch.name)")
            }
            .onAppear(perform: viewModel.start)
            .navigationTitle("Space App 🚀")
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(service: SpaceXAPI.init()))
    }
}
