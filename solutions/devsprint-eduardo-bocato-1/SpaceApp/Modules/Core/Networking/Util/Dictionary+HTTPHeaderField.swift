//
//  Dictionary+HTTPHeaderField.swift
//  SpaceApp
//
//  Created by vinicius.carvalho on 22/03/22.
//

import Foundation

public extension Dictionary where Key == String, Value == String {
    static func headers(_ headers: HTTPHeaderField...) -> Self {
        var dict: [String: String] = .init()
        headers.forEach { dict[$0.key] = $0.value }
        return dict
    }
}
