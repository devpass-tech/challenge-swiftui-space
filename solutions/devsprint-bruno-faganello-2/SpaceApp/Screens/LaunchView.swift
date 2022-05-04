//
//  LaunchView.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

struct LaunchView: View {
    
    //MARK: - Properties
    @ObservedObject private var viewModel: LaunchViewModel
    
    //MARK: - Constructor
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - View
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea(.all)
                
                ScrollView {
                    ForEach(viewModel.launches, id: \.id) { info in
                        LaunchViewCell(
                            viewData: .init(
                                iconImageURL: info.iconImageURL,
                                rocketName: info.rocketName,
                                launchNumber: info.launchNumber,
                                launchDate: info.launchDate)
                        )
                    }
                }
                .padding(.top)
                .navigationTitle("Launches")
                .onAppear(perform: onApearMethod)
            }
        }
    }
    
    //MARK: - Helpers
    private func onApearMethod() {
        setupNavigationBarAppearance()
        viewModel.start()
    }
    
    private func setupNavigationBarAppearance() {
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().backgroundColor = .darkGray
    }
    
    private var navigationLink: some View {
        NavigationLink(
            destination: CompleteDetailsView.init,
            isActive: $viewModel.shouldShowView,
            label: EmptyView.init
        )
    }
}

//MARK: - PreviewProvider
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            LaunchView(viewModel: .init(service: SpaceXAPI()))
        }
    }
}
