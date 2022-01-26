//
//  InfoRowViewTests.swift
//  SpaceAppTests
//
//  Created by Bruna Ebina on 25/01/22.
//

import SnapshotTesting
import XCTest

@testable import SpaceApp

class InfoRowViewTests: XCTestCase {
    func test_detaltApperance() {
        let infoRowViewModelMock = InfoRowViewModelMock(description: "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded...")
        let sut = InfoRowView(infoRowViewModel: infoRowViewModelMock, action: {})

        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }

    func test_apperanceWhenDescriptionShort() {
        let viewModelMock = InfoRowViewModelMock(description: "With the ability to lift")
        let sut = InfoRowView(infoRowViewModel: viewModelMock, action: {})

        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }
}

struct InfoRowViewModelMock: InfoRowViewModelRepresentable {

    var title: String = "Rocket"
    var subtitle: String? = "Falcon Heavy (SpaceX)"
    var description: String
    var buttonText: String = "See more"

    init(description: String) {
        self.description = description
    }
}
