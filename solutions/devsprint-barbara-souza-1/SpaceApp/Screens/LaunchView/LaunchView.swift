//
//  LaunchView.swift
//  SpaceApp
//
//  Created by Mobile2you on 29/01/22.
//

import SwiftUI

struct LaunchView: View {
    
    //MARK: - Constants
    @ObservedObject var viewModel: LaunchViewModel
    
    //MARK: - Init
    init(viewModel: LaunchViewModel = LaunchViewModel()) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    //MARK: - Main View
    var body: some View {
        NavigationView {
            List(viewModel.launchRowCellNumberList.indices, id: \.self) { indice in
                LaunchRowView(viewModel: viewModel.launchRowCellNumberList[indice])
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle(viewModel.navigationViewTitle)
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .preferredColorScheme(.dark)
    }
}
