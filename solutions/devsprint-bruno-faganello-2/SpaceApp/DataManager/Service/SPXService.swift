//
//  SPXService.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import Foundation

protocol SPXServiceProtocol {
    func fetchAllLaunches(_ completion: @escaping ([Launch]?) -> Void)
    func fetchNextLaunch(_ completion: @escaping (NextLaunchResponseModel?) -> Void)
}

final class SPXService: Requester, SPXServiceProtocol {
    
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
