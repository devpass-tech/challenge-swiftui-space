//
//  LaunchDetailsViewModel.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 28/01/22.
//

import Foundation

protocol LaunchDetailsViewModelRepresentable {
    var headerViewModel: DetailsHeaderViewModel { get }
    var detailsViewModel: InfoRowViewModelRepresentable { get }
    var infoViewModel: InfoRowViewModelRepresentable { get }
}

struct LaunchDetailsViewModel: LaunchDetailsViewModelRepresentable {
    var headerViewModel: DetailsHeaderViewModel = .init()
    var detailsViewModel: InfoRowViewModelRepresentable = DetailsInfoRowViewModel()
    var infoViewModel: InfoRowViewModelRepresentable = InfoRowViewModel()
}
