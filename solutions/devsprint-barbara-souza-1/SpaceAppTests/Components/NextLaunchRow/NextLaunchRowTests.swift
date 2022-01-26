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
        let sut = NextLaunchRowView()
        
        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }
}
