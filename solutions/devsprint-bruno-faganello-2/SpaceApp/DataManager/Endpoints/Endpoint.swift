//
//  Endpoint.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String : String] { get }
    var httpHeaders: [HTTPHeaderField : String] { get }
}

extension Endpoint {
    var baseURL: String { "https://api.spacexdata.com/v5/launches" }
    var url: URL { URL(string: "\(baseURL + path)")! }
}
