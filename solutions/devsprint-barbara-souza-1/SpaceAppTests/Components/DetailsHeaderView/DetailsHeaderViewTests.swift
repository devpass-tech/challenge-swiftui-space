import SnapshotTesting
import XCTest

@testable import SpaceApp

class DetailsHeaderViewTests: XCTestCase {
    func test_detaltApperance() {
        let sut = DetailsHeaderView()
        
        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }
    
    func test_failedApperance() {
        
        var viewModelMock = DetailsHeaderViewModel()
        viewModelMock.wasSuccessful = "Failed"
        
        let sut = DetailsHeaderView(viewModel: viewModelMock)
        
        assertSnapshot(matching: sut, as: .image(layout: .device(config: .iPhoneX)))
    }
}
