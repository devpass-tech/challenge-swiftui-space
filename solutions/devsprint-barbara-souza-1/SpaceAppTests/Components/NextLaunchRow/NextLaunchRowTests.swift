//
//  NextLaunchRowTests.swift
//  SpaceAppTests
//
//  Created by Bárbara Souza on 25/01/2022.
//

import SnapshotTesting
import XCTest

@testable import SpaceApp

class NextLaunchRowTests: XCTestCase {
    func test_detaltApperance() {
        let viewModelMock = NextLaunchRowViewModelMock(details: "SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission...")
        let sut = NextLaunchRowView(viewModel: viewModelMock)

        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }
    
    func test_whenDescriptionIsShort() {
        let viewModelMock = NextLaunchRowViewModelMock(details: "SpaceX's 20th")
        let sut = NextLaunchRowView(viewModel: viewModelMock)
        
        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }
}

struct NextLaunchRowViewModelMock: NextLaunchRowViewModelRepresentable {
    var imageUrl: URL? =  URL(string: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")!
    var imageRocket: String =  "image-launch"
    var name: String =  "FalconSat"
    var flightNumber: String = "#140"
    var launchDate: String = "January 20, 2022"
    var details: String
    
    init(details: String) {
        self.details = details
    }
}
