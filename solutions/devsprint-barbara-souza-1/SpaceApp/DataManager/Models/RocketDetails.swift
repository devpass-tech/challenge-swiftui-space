//
//  RocketDetails.swift
//  SpaceApp
//
//  Created by Bruna Ebina on 02/02/22.
//

import Foundation

struct RocketDetails: Decodable, Identifiable {
    let id: String
    let name: String
    let type: String
    let company: String?
    let flickr_images: [String]
    let description: String

    init(id: String, name: String, type: String, company: String, flickr_images: [String], description: String) {
        self.id = id
        self.name = name
        self.type = type
        self.company = company
        self.flickr_images = flickr_images
        self.description = description
    }
}
