//
//  LaunchesPage.swift
//  SpaceApp
//
//  Created by Bárbara Souza on 31/01/2022.
//

import Foundation

struct LaunchesPage: Decodable {
    let docs: [Launch]
    let limit: Int
    let totalPages: Int
    let nextPage: Int
}
