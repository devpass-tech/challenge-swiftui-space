//
//  NetworkManager.swift
//  SpaceApp
//
//  Created by Gustavo Soares on 16/03/22.
//

import Foundation
import Combine

protocol NetworkManager {
    func request(httpMethod: HTTPMethod,
                 url: String,
                 headers: [HTTPHeaderField : String]) -> AnyPublisher<Data, HttpRequestError>
}

final class NetworkManagerService: NetworkManager {

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func request(httpMethod: HTTPMethod,
                 url: String,
                 headers: [HTTPHeaderField : String]) -> AnyPublisher<Data, HttpRequestError> {

        guard let urlRequest = requestBuilder(httpMethod: httpMethod,
                                              url: url,
                                              headers: headers) else {
            return AnyPublisher(Fail(error: .invalidUrl))
        }

        return session
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                switch self.handleStatusCode(response: response) {
                case let .failure(error):
                    throw error
                case .success:
                    return data
                }
            }.mapError { error in
                guard let httpRequestError = error as? HttpRequestError else {
                    return .unkown
                }
                return httpRequestError
            }.eraseToAnyPublisher()
    }

    private func handleStatusCode(response: URLResponse?) -> Result<Void, HttpRequestError> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.invalidHttpResponse)
        }
        switch httpResponse.statusCode {
        case 200 ... 299:
            return .success(())
        case 400 ... 499:
            return .failure(.invalidRequest)
        case 500 ... 599:
            return .failure(.internalServerError)
        default:
            return .failure(.unkown)
        }
    }

    private func requestBuilder(httpMethod: HTTPMethod,
                                url: String,
                                headers: [HTTPHeaderField: String]) -> URLRequest? {

        guard let url = URL(string: url) else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        headers.forEach { headerField, value in
            urlRequest.setValue(value, forHTTPHeaderField: headerField.rawValue)
        }
        return urlRequest
    }
}
