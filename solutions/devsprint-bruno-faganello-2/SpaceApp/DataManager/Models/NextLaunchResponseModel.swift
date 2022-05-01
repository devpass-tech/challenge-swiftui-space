//
//  NextLaunchResponseModel.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

struct NextLaunchResponseModel: Codable, Identifiable {
    let links: NextLaunchLinksResponseModel
    let detail: String?
    let flightNumber: Int
    let aircraftName: String
    let launchDate: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case links = "links"
        case detail = "details"
        case flightNumber = "flight_number"
        case aircraftName = "name"
        case launchDate = "date_utc"
        case id = "id"
    }
}

struct NextLaunchLinksResponseModel: Codable {
    let patch: NextLaunchLinksPathResponseModel
    
    enum CodingKeys: String, CodingKey {
        case patch = "patch"
    }
}

struct NextLaunchLinksPathResponseModel: Codable {
    let small: String
    
    enum CodingKeys: String, CodingKey {
        case small = "small"
    }
}
