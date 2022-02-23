//
//  HTTPClient.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

protocol HTTPClientProtocol: AnyObject {

    var baseURL: URL { get }
    var parameters: [String : String] { get }
    var httpHeaders: [HTTPHeaderField : String] { get }
    var networkClient: NetworkClient { get }
}
