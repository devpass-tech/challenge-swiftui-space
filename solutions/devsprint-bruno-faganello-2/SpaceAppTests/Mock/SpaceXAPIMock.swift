//
//  SpaceXAPIMock.swift
//  SpaceAppTests
//
//  Created by Paolo Prodossimo Lopes on 29/04/22.
//

import XCTest
@testable import SpaceApp

final class SpaceXAPIMock: SpaceXAPIProtocol {
    
    //MARK: - Apies
    private(set) var fetchAllLaunchesWasCalled: Bool = false
    private(set) var fetchNextLaunchWasCalled: Bool = false
    
    //MARK: - Constrollers
    var fetchNextLaunchShouldBeFail: Bool = false
    
    //MARK: - SpaceXAPIProtocol
    func fetchAllLaunches() async -> [Launch]? {
        fetchAllLaunchesWasCalled = true
        return []
    }
    
    func fetchNextLaunch() async -> NextLaunchResponseModel? {
        fetchNextLaunchWasCalled = true
        if fetchNextLaunchShouldBeFail { return nil }
        return JSONHelper.decode()
    }
    
    func fetchNextLaunches() async -> NextLaunchesResponseModel? {
        return nil
    }
}
