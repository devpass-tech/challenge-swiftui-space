//
//  InfoRowViewModel.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 24/01/22.
//

import Foundation

protocol InfoRowViewModelRepresentable {

    var title: String { get }
    var subtitle: String? { get }
    var description: String { get }
    var buttonText: String { get }
}

struct InfoRowViewModel: InfoRowViewModelRepresentable {

    var title: String = "Rocket"
    var subtitle: String? = "Falcon Heavy (SpaceX)"
    var description: String = "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded..."
    var buttonText: String = "See more"
}

