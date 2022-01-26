//
//  DetailView.swift
//  SpaceApp
//
//  Created by cassia franco on 25/01/22.
//

import SwiftUI

struct DetailsView: View {
    
    var viewModel = DetailViewModel()
    
    init(viewModel: DetailViewModel = DetailViewModel()) {
        self.viewModel = viewModel
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(.gray)
    }
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.black
                
                ZStack(alignment: .leading) {
                    Text(viewModel.description)
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .regular))
                        .frame(width: 340, height: 456)
                        .padding(.top , 16)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                VStack {
                                    Text(viewModel.title)
                                        .font(.largeTitle.bold())
                                        .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        }
        .cornerRadius(20)
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
