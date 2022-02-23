//
//  SpaceXAPIClient.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

final class SpaceXAPI {

    var baseURL: URL {

        return URL(string: "https://api.spacexdata.com/v5/launches")!
    }

    var parameters: [String : String] = [:]

    var httpHeaders: [HTTPHeaderField : String] {

        return [HTTPHeaderField.contentType: ContentType.json.rawValue]
    }

    let networkClient = NetworkClient()

    func fetchAllLaunches(completion: @escaping ([Launch]?) -> ()) {

        self.networkClient.get(url: self.baseURL,
                               parameters: self.parameters,
                               headers: self.httpHeaders) { response in

            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    completion(nil)
                    return
                }

                switch response {

                case .result(let data):

                    completion(self.decodeData(data, as: [Launch].self))
                case .error:

                    completion(nil)
                }
            }
        }
    }
    
    func fetchLaunches(query: LaunchesQuery, completion: @escaping ([Launch]?) -> ()) {
        let queryData = try? JSONEncoder().encode(query)
        
        networkClient.post(url: baseURL.appendingPathComponent("query"),
                           parameters: parameters,
                           data: queryData,
                           headers: httpHeaders) { response in
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    completion(nil)
                    return
                }
                
                switch response {
                case .result(let data):
                    completion(self.decodeData(data, as: LaunchesPage.self)?.docs)
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


