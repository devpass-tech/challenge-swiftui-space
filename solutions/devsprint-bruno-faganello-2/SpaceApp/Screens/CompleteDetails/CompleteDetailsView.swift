//
//  CompleteDetailsView.swift
//  SpaceApp
//
//  Created by Pedro Léda on 27/04/22.
//

import SwiftUI

struct CompleteDetailsView: View {
    
    var viewModel: CompleteDetailsViewModel
    
    init(viewModel: CompleteDetailsViewModel = CompleteDetailsViewModel()) {
        self.viewModel = viewModel
        UINavigationBar.appearance().backgroundColor = UIColor(.gray)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                ScrollView {
                    Text(viewModel.description)
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .regular))
                        .padding([.top, .leading, .trailing] , 20)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text(viewModel.title).font(.headline)
                            }
                        }
                }
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteDetailsView()
    }
}
