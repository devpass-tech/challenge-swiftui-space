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
            InfoRowView(infoRowViewModel: InfoRowViewModel(), action: {})
               
            .onAppear() {
                InfoRowView(infoRowViewModel: InfoRowViewModel(), action: {})
            }.navigationTitle("Space App 🚀")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
