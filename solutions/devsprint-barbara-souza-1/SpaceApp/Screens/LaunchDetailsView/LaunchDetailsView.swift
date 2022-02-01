//
//  LaunchDetailsView.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 28/01/22.
//

import SwiftUI

struct LaunchDetailsView: View {
    // MARK: Properties
    var viewModel: LaunchDetailsViewModelRepresentable
    var imageSize: CGFloat = 130
    var backgroundColor: Color = .appGray

    // MARK: Initializer
    init(viewModel: LaunchDetailsViewModelRepresentable = LaunchDetailsViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack (spacing: 32) {
                    DetailsHeaderView(viewModel: viewModel.headerViewModel)
                    InfoRowView(infoRowViewModel: viewModel.detailsViewModel,
                                action: {})
                    InfoRowView(infoRowViewModel: viewModel.infoViewModel,
                                action: {})
                }.padding(36)
            }
        }
    }
}

struct LaunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsView()
    }
}
