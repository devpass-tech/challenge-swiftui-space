//
//  HttpErrors.swift
//  SpaceApp
//
//  Created by Gustavo Soares on 16/03/22.
//

import Foundation

public enum HttpRequestError: LocalizedError {
    case unkown
    case invalidRequest
    case jsonDecodeError
    case internalServerError
    case invalidUrl
    case invalidHttpResponse
    case emptyData
}
