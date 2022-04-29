//
//  HomeView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    private var BGColor: Color { Color.init(red: 25/255, green: 25/255, blue: 25/255) }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                ScrollView {
                    NextLaunchViewCell(viewData: viewModel.nextLaunch)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .background(BGColor)
            .navigationTitle("Home")
            .onAppear(perform: onAppear)
        }
    }
    
    private func onAppear() {
        setupNavigationBarAppearance()
        viewModel.start()
    }
    
    private func setupNavigationBarAppearance() {
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().prefersLargeTitles = false
        UINavigationBar.appearance().backgroundColor = .init(
            red: 25/255, green: 25/255, blue: 25/255, alpha: 1
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(service: SpaceXAPI.init()))
    }
}
