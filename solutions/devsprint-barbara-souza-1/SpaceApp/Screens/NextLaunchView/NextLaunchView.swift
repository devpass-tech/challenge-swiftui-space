//
//  NextLaunchRowView.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 27/01/22.
//
import Foundation
import SwiftUI

struct NextLaunchView: View {

    var viewModel: NextLaunchViewModelRepresentable

    init(viewModel: NextLaunchViewModelRepresentable) {
    self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack (spacing: 16) {
                Text(viewModel.subtitle)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                NextLaunchRowView(viewModel: viewModel.nextLaunchRow)
                Spacer()
            }
            .padding(.leading, 19)
            .padding(.trailing, 19)
            .navigationBarTitle(viewModel.title)
        }
    }
}

struct NextLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchView(viewModel: NextLaunchViewModel())
            .preferredColorScheme(.dark)
    }
}
