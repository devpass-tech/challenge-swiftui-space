//
//  NetworkClient.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

final class NetworkClient {
    
    func get(url: URL,
             parameters: [String : String],
             headers: [HTTPHeaderField : String]) async -> Response {
        
        return await performRequest(httpMethod: .get,
                            url: url,
                            parameters: parameters,
                            headers: headers)
    }
    
    func post(url: URL,
              parameters: [String : String],
              headers: [HTTPHeaderField : String],
              completion: @escaping (Response) -> ()) {
        
        self.performRequest(httpMethod: .post,
                            url: url,
                            parameters: parameters,
                            headers: headers,
                            completion: completion)
    }
    
    func performRequest(httpMethod: HTTPMethod, url: URL, parameters: [String : String], headers: [HTTPHeaderField : String], completion: @escaping (Response) -> ()) {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        
        headers.forEach { headerField, value in
            
            request.setValue(value, forHTTPHeaderField: headerField.rawValue)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                completion(.error(error))
                return
            }
            
            guard let data = data else {
                
                completion(.error(nil))
                return
            }
            
            completion(.result(data))
        }
        task.resume()
    }
    
    func performRequest(
        httpMethod: HTTPMethod, url: URL,
        parameters: [String : String],
        headers: [HTTPHeaderField : String]
    ) async -> Response {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        
        headers.forEach { headerField, value in
            request.setValue(value, forHTTPHeaderField: headerField.rawValue)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return .result(data)
        } catch {
            return .error(SpaceXAPIErrors.RequestFail)
        }
    }
}

enum SpaceXAPIErrors: Error {
    case RequestFail
}
