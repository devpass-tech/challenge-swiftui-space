//
//  AllLaunchesResponse.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

struct Launch: Decodable, Identifiable {
    let id: String
    let name: String
    let links: Links
    let success: Bool
    let details: String?
    let flightNumber: Int
    let data: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case links
        case success
        case details
        case flightNumber = "flight_number"
        case data = "date_utc"
    }
    
    struct Links: Decodable {
        let patch: Patch
        
        struct Patch: Decodable {
            let small: String
            let large: String
        }
    }
}
