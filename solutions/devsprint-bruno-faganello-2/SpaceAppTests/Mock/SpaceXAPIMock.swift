//
//  SpaceXAPIMock.swift
//  SpaceAppTests
//
//  Created by Paolo Prodossimo Lopes on 29/04/22.
//

import XCTest
@testable import SpaceApp

final class SpaceXAPIMock: SpaceXAPIProtocol {
    
    private(set) var fetchAllLaunchesWasCalled: Bool = false
    private(set) var fetchNextLaunchWasCalled: Bool = false
    
    var fetchNextLaunchShouldBeFail: Bool = false
    
    func fetchAllLaunches() async -> [Launch]? {
        fetchAllLaunchesWasCalled = true
        return []
    }
    
    func fetchNextLaunch() async -> NextLaunchResponseModel? {
        fetchNextLaunchWasCalled = true
        if fetchNextLaunchShouldBeFail { return nil }
        return JSONHelper.decode()
    }
}
