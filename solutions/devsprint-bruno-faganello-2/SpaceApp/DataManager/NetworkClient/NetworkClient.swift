//
//  NetworkClient.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

struct NetworkClient {
    
    //MARK: - Methods
    func get(endpoint: Endpoint) async -> Response {
        return await performRequest(httpMethod: .get, endpoint: endpoint)
    }
    
    func post(endpoint: Endpoint) async -> Response {
        return await performRequest(httpMethod: .post, endpoint: endpoint)
    }
    
    //MARK: - Helpers
    
    private func performRequest(httpMethod: HTTPMethod, endpoint: Endpoint) async -> Response {
        
        let request = configureURLRequest(httpMethod: httpMethod,endpoint: endpoint)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            return handleRequestResult(data: data, response: response)
        } catch {
            return .error(SpaceXAPIErrors.RequestFail)
        }
    }
    
    private func configureURLRequest(httpMethod: HTTPMethod, endpoint: Endpoint) -> URLRequest {
        var components = URLComponents(url: endpoint.url, resolvingAgainstBaseURL: true)!
        components.queryItems = endpoint.parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        
        endpoint.httpHeaders.forEach { headerField, value in
            request.setValue(value, forHTTPHeaderField: headerField.rawValue)
        }
        
        return request
    }
    
    private func handleRequestResult(data: Data, response: URLResponse) -> Response {
        if let response = response as? HTTPURLResponse {
            switch response.statusCode {
            case 200:
                return .result(data)
            case 201...299:
                return .error(SpaceXAPIErrors.ResponseInvalid)
            case 401:
                return .error(SpaceXAPIErrors.unauthorized)
            default:
                return .error(SpaceXAPIErrors.unexpectedStatusCode)
            }
        }
        
        return .error(SpaceXAPIErrors.withoutResponse)
    }
}
