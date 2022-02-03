//
//  LaunchDetailsView.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 28/01/22.
//

import SwiftUI

struct LaunchDetailsView<LaunchDetailsObservable>: View where LaunchDetailsObservable: LaunchDetailsViewModelRepresentable {
    // MARK: Properties
    @ObservedObject private var viewModel: LaunchDetailsObservable
    var rocketID = "5e9d0d95eda69974db09d1ed"
    var imageSize: CGFloat = 130
    var backgroundColor: Color = .appGray


    // MARK: Initializer
    init(viewModel: LaunchDetailsObservable) {
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
                    .onAppear() {
                        viewModel.rocketDetailsOnAppear(rocketID: rocketID)
                    }
            }
        }
    }
}


struct LaunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsView(viewModel: LaunchDetailsViewModel())
    }
}
