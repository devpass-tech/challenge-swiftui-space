//
//  NetworkManager.swift
//  SpaceApp
//
//  Created by Gustavo Soares on 16/03/22.
//

import Foundation
import Combine

protocol NetworkManager {
    func request(httpMethod: HTTPMethod, url: String, parameters: [String : String], headers: [HTTPHeaderField : String]) -> AnyPublisher<Data, HttpRequestError>
}

final class NetworkManagerService: NetworkManager {

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func request(httpMethod: HTTPMethod, url: String,
                 parameters: [String : String],
                 headers: [HTTPHeaderField : String] = [:]) -> AnyPublisher<Data, HttpRequestError> {

        guard let urlRequest = requestBuilder(httpMethod: httpMethod, url: url) else {
            return AnyPublisher(Fail(error: .invalidUrl))
        }

        return session
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in

                guard let httpResponseData = response as? HTTPURLResponse else {
                    throw HttpRequestError.invalidHttpResponse
                }

                switch httpResponseData.statusCode {
                case 200...299:
                    return data
                default:
                    throw HttpRequestError.emptyData
                }

            }.mapError { error in

                guard let httpRequestError = error as? HttpRequestError else {
                    return .unkown
                }
                return httpRequestError

            }.eraseToAnyPublisher()
    }

    private func requestBuilder(httpMethod: HTTPMethod, url: String, headers: [HTTPHeaderField: String] = [:]) -> URLRequest? {

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
