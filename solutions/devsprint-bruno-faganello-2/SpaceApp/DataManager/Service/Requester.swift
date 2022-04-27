//
//  Requester.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import Foundation

class Requester {
    
    //MARK: - Propertie
    private let networkClient: NetworkClient
    
    //MARK: - Constructor
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    //MARK: - Methods
    func perform<T: Codable>(with endpoint: Endpoint, completion: @escaping (T?) -> Void) {
        networkClient.get(
            url: endpoint.url, parameters: endpoint.parameters,
            headers: endpoint.httpHeaders
        ) { result in
            self.handleResult(result: result, completion: completion)
        }
    }
    
    //MARK: - Helpers
    private func handleResult<T: Codable>(
        result: Response, completion: @escaping (T?) -> Void
    ) {
        var completionValue: T?
        
        defer {
            DispatchQueue.main.async { completion(completionValue) }
        }
        
        switch result {
        case .result(let data):
            completionValue = decode(data: data)
        case .error:
            completionValue = nil
        }
    }
    
    private func decode<T: Codable>(data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            print("❌ Decode object fail...")
            return nil
        }
    }
}
