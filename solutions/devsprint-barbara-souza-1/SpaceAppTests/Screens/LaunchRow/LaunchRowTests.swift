//
//  LaunchRowTests.swift
//  SpaceAppTests
//
//  Created by Mobile2you on 29/01/22.
//

import SnapshotTesting
import XCTest

@testable import SpaceApp

class LaunchRowTests: XCTestCase {
    
    func testLaunchRowAppearance() {
        let sut = LaunchView()
            .frame(width: 414, height: 612)
        
        assertSnapshot(matching: sut, as: .image)
    }
}
