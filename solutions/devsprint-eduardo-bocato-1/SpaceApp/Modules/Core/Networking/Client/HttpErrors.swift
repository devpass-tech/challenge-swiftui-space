//
//  HttpErrors.swift
//  SpaceApp
//
//  Created by Gustavo Soares on 16/03/22.
//

import Foundation


public enum HttpRequestError: LocalizedError {
    // TODO: Create a errorDescription customized
    case unkown
    case invalidRequest
    case notAuthorized
    case jsonDecodeError
    case networkError
    case invalidUrl
    case invalidHttpResponse
case emptyData
}
