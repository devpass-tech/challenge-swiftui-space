//
//  NextLaunchRowViewModel.swift
//  SpaceApp
//
//  Created by Pedro Gabriel on 24/01/22.
//

import Foundation

protocol NextLaunchRowViewModelRepresentable {
    var imageUrl: URL? { get }
    var imageRocket: String { get }
    var name: String { get }
    var flightNumber: String { get }
    var launchDate: String { get }
    var details: String { get }
}

struct NextLaunchRowViewModel: NextLaunchRowViewModelRepresentable {
    var imageUrl: URL? {
        URL(string: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")!
    }

    var imageRocket: String {
        "image-launch"
    }

    var name: String {
        "FalconSat"
    }

    var flightNumber: String {
        "#140"
    }

    var launchDate: String {
        "January 20, 2022"
    }

    var details: String {
        "SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission..."
    }
}
