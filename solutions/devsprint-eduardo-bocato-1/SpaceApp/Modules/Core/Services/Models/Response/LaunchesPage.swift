//
//  LaunchesPage.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 28/03/22.
//

import Foundation

struct LaunchesPage: Decodable {
    let docs: [Launch]
    let limit: Int
    let totalPages: Int
    let nextPage: Int
}
