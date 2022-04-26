//
//  SPStringExtension.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 25/04/22.
//

import SwiftUI

struct SPStringExtension {
    
    let support: String
    
    var asText: Text { .init(support) }
}
