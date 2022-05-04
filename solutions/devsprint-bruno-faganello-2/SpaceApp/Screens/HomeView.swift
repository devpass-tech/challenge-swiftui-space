//
//  HomeView.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel: HomeViewModel
    
    //MARK: - View
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                
                VStack {
                    NextLaunchViewCell(viewData: viewModel.nextLaunch)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .background(Color.darkGray)
            .navigationTitle("Home")
            .onAppear(perform: onAppear)
        }
    }
    
    //MARK: - Helpers
    private func onAppear() {
        setupNavigationBarAppearance()
        viewModel.start()
    }
    
    private func setupNavigationBarAppearance() {
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().backgroundColor = .darkGray
    }
}

//MARK: - PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(service: SpaceXAPI.init()))
    }
}
