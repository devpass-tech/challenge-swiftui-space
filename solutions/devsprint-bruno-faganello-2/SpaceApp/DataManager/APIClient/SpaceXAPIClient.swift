//
//  SpaceXAPIClient.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

protocol SpaceXAPIProtocol {
    func fetchAllLaunches() async -> [Launch]?
    func fetchNextLaunch() async -> NextLaunchResponseModel?
}

final class SpaceXAPI: Requester, SpaceXAPIProtocol {

    //MARK: - Constructor
    override init(networkClient: NetworkClient = .init()) {
        super.init(networkClient: networkClient)
    }
    
    //MARK: - Methods
    func fetchAllLaunches() async -> [Launch]? {
        let endpoint = AllLaunchsEndpoint()
        return await performGET(with: endpoint)
    }
    
    func fetchNextLaunch() async -> NextLaunchResponseModel? {
        let endpoint = NextLaunchsEndpoint()
        return await performGET(with: endpoint)
    }
}


