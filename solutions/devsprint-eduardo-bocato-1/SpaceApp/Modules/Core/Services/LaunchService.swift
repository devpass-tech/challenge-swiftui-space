//
//  LaunchService.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 16/03/22.
//

import Foundation
import Combine

protocol LaunchServiceProtocol {
    func fetchAllLaunches() -> AnyPublisher<[Launch], HTTPRequestError>
}

final class LaunchServiceImplementation: LaunchServiceProtocol {

    // MARK: - Private Properties

    private let networking: NetworkManager

    init(networking: NetworkManager = NetworkManagerService()) {
        self.networking = networking
    }

    func fetchAllLaunches() -> AnyPublisher<[Launch], HTTPRequestError> {
        networking.request(httpMethod: .get, url: SpaceXAPI.baseURL.absoluteString, parameters: [:], headers: [:])
            .decode(
                type: [Launch].self,
                decoder: JSONDecoder()
            )
            .mapError { _ in
                return HTTPRequestError.jsonDecodeError
            }
            .eraseToAnyPublisher()
    }

}
