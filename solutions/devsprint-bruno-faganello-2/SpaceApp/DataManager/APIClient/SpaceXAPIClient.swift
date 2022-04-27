//
//  SpaceXAPIClient.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

protocol SpaceXAPIProtocol {
    func fetchAllLaunches(_ completion: @escaping ([Launch]?) -> Void)
    func fetchNextLaunch(_ completion: @escaping (NextLaunchResponseModel?) -> Void)
}

final class SpaceXAPI: Requester, SpaceXAPIProtocol {

    //MARK: - Constructor
    override init(networkClient: NetworkClient = .init()) {
        super.init(networkClient: networkClient)
    }
    
    //MARK: - Methods
    func fetchAllLaunches(_ completion: @escaping ([Launch]?) -> Void) {
        let endpoint = AllLaunchsEndpoint()
        perform(with: endpoint, completion: completion)
    }
    
    func fetchNextLaunch(_ completion: @escaping (NextLaunchResponseModel?) -> Void) {
        let endpoint = NextLaunchsEndpoint()
        perform(with: endpoint, completion: completion)
    }
}


