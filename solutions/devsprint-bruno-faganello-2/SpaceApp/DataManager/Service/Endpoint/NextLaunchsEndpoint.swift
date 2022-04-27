//
//  NextLaunchsEndpoint.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

struct NextLaunchsEndpoint: Endpoint {
    var path: String = "/next"
    var parameters: [String : String] = [:]
    var httpHeaders: [HTTPHeaderField : String] = [:]
}
