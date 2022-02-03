//
//  LaunchDetailsViewTests.swift
//  SpaceAppTests
//
//  Created by Pedro Gabriel on 28/01/22.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SpaceApp

class LaunchDetailsViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchDetailsView() throws {
        let sut = LaunchDetailsView(viewModel: LaunchDetailsViewModelStub())
        let view = UIHostingController(rootView: sut)

        assertSnapshot(matching: view, as: .image)
    }

}

class LaunchDetailsViewModelStub: LaunchDetailsViewModelRepresentable {

    var headerViewModel: DetailsHeaderViewModel = .init()
    var detailsViewModel: InfoRowViewModelRepresentable = DetailsInfoRowViewModel()
    var infoViewModel: InfoRowViewModelRepresentable = InfoRowViewModel(
        title: "Title",
        subtitle: "Subtitle",
        description: "Description",
        buttonText: "See more"
    )
    func rocketDetailsOnAppear(rocketID: String) {}
}

