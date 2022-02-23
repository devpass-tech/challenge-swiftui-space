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
        let sut = LaunchRowView(viewModel: LaunchRowViewModel(launchPatchURL:  "https://images2.imgbox.com/02/51/7NLaBm8c_o.png",
                                                              launchName: "CRS-20",
                                                              launchDate: "July 03, 2020",
                                                              launchStatus: "Success",
                                                              launchNumber: "#91"))
            .frame(width: 414, height: 612)
        
        assertSnapshot(matching: sut, as: .image)
    }
}
