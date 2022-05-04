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
                Color.black
                
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

            }
            .background(Color.darkGray)
            .navigationTitle("Launches")
            .onAppear(perform: onApearMethod)
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
