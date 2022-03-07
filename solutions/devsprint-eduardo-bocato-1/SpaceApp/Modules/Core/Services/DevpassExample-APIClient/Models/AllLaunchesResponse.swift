//
//  AllLaunchesResponse.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/01/22.
//

import Foundation

struct Launch: Decodable, Identifiable, Equatable {
    let id: String
    let name: String
}
