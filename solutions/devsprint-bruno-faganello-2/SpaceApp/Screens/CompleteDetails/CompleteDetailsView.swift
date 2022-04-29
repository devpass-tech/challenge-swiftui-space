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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteDetailsView()
    }
}
