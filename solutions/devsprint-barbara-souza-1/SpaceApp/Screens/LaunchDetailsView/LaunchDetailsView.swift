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
    var pressedSeeMoreDetails: (() -> Void)
    var pressedSeeMoreInfo: (() -> Void)

    // MARK: Initializer
    init(viewModel: LaunchDetailsViewModelRepresentable,
         pressedSeeMoreDetails: @escaping (() -> Void),
         pressedSeeMoreInfo: @escaping (() -> Void)) {
        self.viewModel = viewModel
        self.pressedSeeMoreDetails = pressedSeeMoreDetails
        self.pressedSeeMoreInfo = pressedSeeMoreInfo
    }

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack (spacing: 32) {
                    DetailsHeaderView(viewModel: viewModel.headerViewModel)
                    InfoRowView(infoRowViewModel: viewModel.detailsViewModel,
                                action: self.pressedSeeMoreDetails)
                    InfoRowView(infoRowViewModel: viewModel.infoViewModel,
                                action: self.pressedSeeMoreInfo)
                }.padding(36)
            }
        }
    }
}

struct LaunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let printSomething: (() -> Void) = {
            print("do Something")
        }
        LaunchDetailsView(viewModel: LaunchDetailsViewModel(),
                          pressedSeeMoreDetails: printSomething,
                          pressedSeeMoreInfo: printSomething)
    }
}
