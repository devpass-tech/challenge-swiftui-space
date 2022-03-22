//
//  HTTPRequestError.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 18/03/22.
//

import Foundation

enum HTTPRequestError: Error, Equatable {
    case requestSerialization(Error)
    case invalidRequest
    case networking(Error)
    case urlError(URLError)
    case invalidHTTPResponse
    case unreachableNetwork
    case yielding(data: Data, statusCode: Int)
    case jsonDecoding(Error)
    case dataParsing(Error)
    case unexpected

    public static func == (lhs: HTTPRequestError, rhs: HTTPRequestError) -> Bool {
        switch (lhs, rhs) {
        case let (.requestSerialization(e1), .requestSerialization(e2)):
            return e1 as NSError == e2 as NSError
        case (.invalidRequest, .invalidRequest):
            return true
        case let (.networking(e1), .networking(e2)):
            return e1 as NSError == e2 as NSError
        case let (.urlError(e1), .urlError(e2)):
            return e1 == e2
        case (.invalidHTTPResponse, .invalidHTTPResponse):
            return true
        case (.unreachableNetwork, .unreachableNetwork):
            return true
        case let (.yielding(d1, c1), .yielding(d2, c2)):
            return d1 == d2 && c1 == c2
        case let (.jsonDecoding(e1), .jsonDecoding(e2)):
            return e1 as NSError == e2 as NSError
        case let (.dataParsing(e1), .dataParsing(e2)):
            return e1 as NSError == e2 as NSError
        case (.unexpected, .unexpected):
            return true
        default:
            return false
        }
    }
}

extension HTTPRequestError {
    public var data: Data? {
        guard
            case let .yielding(data, _) = self
        else { return nil }
        return data
    }
}
