//
//  NextLaunchViewTests.swift
//  SpaceAppTests
//
//  Created by Bruna Ebina on 29/01/22.
//

import SnapshotTesting
import XCTest
@testable import SpaceApp

class NextLaunchViewTests: XCTestCase {
    func testNextLaunchViewAppearance() {
        let sut = NextLaunchView(viewModel: NextLaunchViewModelMock())
            .frame(width: 414, height: 612)
        assertSnapshot(matching: sut, as: .image)
    }
}

struct NextLaunchViewModelMock: NextLaunchViewModelRepresentable {

    var title: String = "Home"
    var subtitle: String = "Upcoming"
    var nextLaunchRow: NextLaunchRowViewModelRepresentable = NextLaunchRowViewModel()
}
