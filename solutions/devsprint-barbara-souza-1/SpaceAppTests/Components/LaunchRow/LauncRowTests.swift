//
//  LauncRowTests.swift
//  SpaceAppTests
//
//  Created by Mobile2you on 27/01/22.
//
import SnapshotTesting
import XCTest

@testable import SpaceApp

class LauncRowTests: XCTestCase {

    func testLaunchRowAppearance() {
        let sut = LaunchRowView()
            .frame(width: 414, height: 612)
        
        assertSnapshot(matching: sut, as: .image)
    }
}
