//
//  SpaceXAPIErrors.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 27/04/22.
//

enum SpaceXAPIErrors: Error {
    case RequestFail
    case ResponseInvalid
    case unauthorized
    case unexpectedStatusCode
    case withoutResponse
}
