//
//  LaunchView.swift
//  SpaceApp
//
//  Created by Mobile2you on 29/01/22.
//

import SwiftUI

struct LaunchView: View {
    
    //MARK: - Constants
    let viewModel: LaunchViewModel
    
    //MARK: - Init
    init(viewModel: LaunchViewModel = LaunchViewModel()) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    //MARK: - Main View
    var body: some View {
        NavigationView {
            List(0..<viewModel.launchRowCellNumberList.count) { item in
                viewModel.launchRowCellNumberList[item]
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle(viewModel.navigationViewTitle)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .preferredColorScheme(.dark)
    }
}
