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
    func perform<T: Codable>(with endpoint: Endpoint) async -> T? {
        let result = await networkClient.get(
            url: endpoint.url, parameters: endpoint.parameters,
            headers: endpoint.httpHeaders
        )
        return self.handleResult(result: result, expect: T.self)
    }
    
    //MARK: - Helpers
    private func handleResult<T: Codable>(result: Response, expect: T.Type) -> T? {
        var completionValue: T?
        
        switch result {
        case .result(let data):
            completionValue = decode(data: data)
        case .error:
            completionValue = nil
        }
        
        return completionValue
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
