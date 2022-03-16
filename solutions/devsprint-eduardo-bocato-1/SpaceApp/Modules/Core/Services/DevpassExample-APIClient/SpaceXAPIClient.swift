//
//  SpaceXAPIClient.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation
import Combine

final class SpaceXAPI {

    static var baseURL: URL {
        return URL(string: "https://api.spacexdata.com/v5/launches")!
    }

    var baseUrlString: String {
        "https://api.spacexdata.com/v5/launches"
    }

    var parameters: [String : String] = [:]

    var httpHeaders: [HTTPHeaderField : String] {

        return [:]
    }

    let networkClient = NetworkClient()

    private let networkManager: NetworkManager

    private var testRequestCancellable: AnyCancellable?

    init(networkManager: NetworkManager = NetworkManagerService()) {
        self.networkManager = networkManager
    }

    func testRequest() {
        testRequestCancellable = networkManager.request(httpMethod: .get,
                               url: baseUrlString,
                               parameters: parameters,
                               headers: httpHeaders).sink { completion in
            if case let .failure(error) = completion {
                print(error)
            }
        } receiveValue: { data in
            print(data)
        }
    }

    func fetchAllLaunches(completion: @escaping ([Launch]?) -> ()) {

        self.networkClient.get(url: SpaceXAPI.baseURL,
                               parameters: self.parameters,
                               headers: self.httpHeaders) { response in

            DispatchQueue.main.async {

                switch response {

                case .result(let data):

                    completion(self.decodeData(data))
                case .error:

                    completion(nil)
                }
            }
        }
    }

    private func decodeData(_ data: Data) -> [Launch]? {

        let jsonDecoder = JSONDecoder()
        do {

            let response = try jsonDecoder.decode([Launch].self, from: data)
            return response
        } catch {
            print(error)
            return nil
        }
    }
}


