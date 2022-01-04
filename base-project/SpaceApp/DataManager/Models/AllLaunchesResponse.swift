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
}
