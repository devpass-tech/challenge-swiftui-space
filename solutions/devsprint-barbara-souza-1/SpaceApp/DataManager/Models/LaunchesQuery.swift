//
//  LaunchesQuery.swift
//  SpaceApp
//
//  Created by Bárbara Souza on 31/01/2022.
//

import Foundation

struct LaunchesQuery: Encodable {
    let options: Options
    
    struct Options: Encodable {
        let limit: Int
    }
}
