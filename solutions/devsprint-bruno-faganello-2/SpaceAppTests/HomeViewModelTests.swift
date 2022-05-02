//
//  HomeViewModelTests.swift
//  SpaceAppTests
//
//  Created by Paolo Prodossimo Lopes on 29/04/22.
//

import XCTest
@testable import SpaceApp

import UIKit
import SwiftUI

final class HomeViewModelTests: XCTestCase {
    
    //MARK: - Properties
    private var serviceMock: SpaceXAPIMock!
    private var sut: HomeViewModel!
    
    //MARK: - Setup
    override func setUp() {
        makeSUT()
    }
    
    //MARK: - Tests
    func test_HomeViewModel_NextLaunchPropertie_WhenInititlize_ShouldbeNil() {
        XCTAssertNil(sut.nextLaunch)
    }
    
    func test_HomeViewModel_NextLaunchPropertie_WhenStart_ShouldbeNotNil() {
        sut.start()
        wait { XCTAssertNotNil(self.sut.nextLaunch) }
    }
    
    func test_HomeViewModel_FetchNextLaunchWasCalled_WhenStartCall_ShoudlBeCalled() {
        sut.start()
        wait { XCTAssertTrue(self.serviceMock.fetchNextLaunchWasCalled) }
    }
    
    func test_HomeViewModel_nextLaunchPropertie_WhenAPIFail_ShouldBeNil() {
        serviceMock.fetchNextLaunchShouldBeFail = true
        sut.start()
        wait { XCTAssertNil(self.sut.nextLaunch) }
    }
    
    func test_HomeViewModel_rocketNamePropertie_WhenAPISucceded_ShouldBeEqualExpected() {
        sut.start()
        wait { XCTAssertEqual(self.sut?.nextLaunch?.rocketName, Constants.jsonRocketName) }
    }
    
    func test_HomeViewModel_launchDatePropertie_WhenAPISucceded_ShouldBeEqualExpected() {
        sut.start()
        wait { XCTAssertEqual(self.sut?.nextLaunch?.launchDate, Constants.jsonLaunchDate) }
    }
    
    func test_HomeViewModel_descriptionPropertie_WhenAPISucceded_ShouldBeEqualExpected() {
        sut.start()
        wait { XCTAssertEqual(self.sut?.nextLaunch?.description, Constants.jsonDescription) }
    }
    
    func test_HomeViewModel_launchNumberPropertie_WhenAPISucceded_ShouldBeEqualExpected() {
        sut.start()
        wait { XCTAssertEqual(self.sut?.nextLaunch?.launchNumber, Constants.jsonLaunchNumber) }
    }
    
    //MARK: - TearDown
    override func tearDown() {
        serviceMock = nil
        sut = nil
    }
}

//MARK: - Helpers
private extension HomeViewModelTests {
    
    func makeSUT() {
        serviceMock = .init()
        sut = .init(service: serviceMock)
    }
    
    func wait(completion: @escaping (() -> Void)) {
        let exp = expectation(description: "exp")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            exp.fulfill()
            completion()
        }
        wait(for: [exp], timeout: 2.0)
    }
    
    struct Constants {
        static let jsonRocketName = "CRS-20"
        static let jsonLaunchDate = "março 7, 2020"
        static let jsonLaunchNumber = "#91"
        static let jsonDescription = "SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission brings essential supplies to the International Space Station using SpaceX's reusable Dragon spacecraft. It is the last scheduled flight of a Dragon 1 capsule. (CRS-21 and up under the new Commercial Resupply Services 2 contract will use Dragon 2.) The external payload for this mission is the Bartolomeo ISS external payload hosting platform. Falcon 9 and Dragon will launch from SLC-40, Cape Canaveral Air Force Station and the booster will land at LZ-1. The mission will be complete with return and recovery of the Dragon capsule and down cargo."
    }
}
