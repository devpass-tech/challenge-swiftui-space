//
//  NextLaunchRowViewModel.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 27/01/22.
//

import Foundation

protocol NextLaunchViewModelRepresentable {

    var title: String { get }
    var subtitle: String { get }
    var nextLaunchRow: NextLaunchRowViewModelRepresentable { get }

}

struct NextLaunchViewModel: NextLaunchViewModelRepresentable {

    var title: String = "Home"
    var subtitle: String = "Upcoming"
    var nextLaunchRow: NextLaunchRowViewModelRepresentable = NextLaunchRowViewModel()
}

