//
//  SpaceXAPIRocketDetails.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 02/02/22.
//

import Foundation

final class SpaceXAPIRocketDetails {

    var baseURL: URL {

        return URL(string: "https://api.spacexdata.com/v4/rockets/)")!
    }

    var parameters: [String : String] = [:]

    var httpHeaders: [HTTPHeaderField : String] {

        return [HTTPHeaderField.contentType: ContentType.json.rawValue]
    }

    let networkClient = NetworkClient()

    func fetchRocketDetails(rocketID: String, completion: @escaping (RocketDetails?) -> ()) {

        self.networkClient.get(url: URL(string: "https://api.spacexdata.com/v4/rockets/\(rocketID)")!,
                               parameters: self.parameters,
                               headers: self.httpHeaders) { response in

            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    completion(nil)
                    return
                }

                switch response {
                case .result(let data):
                    completion(self.decodeData(data, as: RocketDetails.self))
                case .error:
                    completion(nil)
                }
            }
        }
    }

    private func decodeData<DecodableType: Decodable>(_ data: Data,
                                                      as type: DecodableType.Type) -> DecodableType? {

        let jsonDecoder = JSONDecoder()
        do {

            let response = try jsonDecoder.decode(type, from: data)
            return response
        } catch {
            print(error)
            return nil
        }
    }
}
