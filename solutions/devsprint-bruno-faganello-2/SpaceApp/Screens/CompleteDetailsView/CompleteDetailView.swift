//
//  CompleteDetailView.swift
//  SpaceApp
//
//  Created by Pedro Léda on 02/05/22.
//

import SwiftUI

struct CompleteDetailsView: View {
    
    var viewModel: CompleteDetailsViewModel
    
    init(viewModel: CompleteDetailsViewModel = CompleteDetailsViewModel()) {
        self.viewModel = viewModel
        setupToolBar()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    Text(viewModel.description)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .regular))
                        .padding([.top, .leading, .trailing] , 20)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text(viewModel.title).font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                }
            }
        }
    }
}

func setupToolBar(){
    let coloredAppearance = UINavigationBarAppearance()
     coloredAppearance.configureWithOpaqueBackground()
     coloredAppearance.backgroundColor = .darkGray
     coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
     coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

     UINavigationBar.appearance().standardAppearance = coloredAppearance
     UINavigationBar.appearance().compactAppearance = coloredAppearance
     UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

     UINavigationBar.appearance().tintColor = .white
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteDetailsView()
    }
}

