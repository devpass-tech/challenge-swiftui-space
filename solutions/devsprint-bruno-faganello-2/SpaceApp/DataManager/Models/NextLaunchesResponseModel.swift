//
//  NextLaunchesResponseModel.swift
//  SpaceApp
//
//  Created by Pedro Boga on 02/05/22.
//

import Foundation

struct NextLaunchesResponseModel: Codable, Identifiable {
    let docs: [NextLaunchesDocsResponseModel]?
    var id: UUID {
        return .init()
    }
}

struct NextLaunchesDocsResponseModel: Codable {
    let links: NextLaunchesLinksResponseModel
    let success: Bool
    let flightNumber: Int
    let name: String
    let date: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case links, success
        case flightNumber = "flight_number"
        case name
        case date = "date_utc"
        case id
    }
}

struct NextLaunchesLinksResponseModel: Codable {
    let patch: NextLaunchesLinksPatchResponseModel
}

struct NextLaunchesLinksPatchResponseModel: Codable {
    let small: String
}
