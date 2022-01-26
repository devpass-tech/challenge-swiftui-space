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
        let sut = InfoRowView(infoRowViewModel: InfoRowViewModel(), action: {})

        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }
}
