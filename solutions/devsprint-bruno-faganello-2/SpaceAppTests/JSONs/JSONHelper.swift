//
//  JSONHelper.swift
//  SpaceAppTests
//
//  Created by Paolo Prodossimo Lopes on 29/04/22.
//

import Foundation
@testable import SpaceApp

final class RefBundle { }

struct JSONHelper {
    
    enum Files: String {
        case nextLaunch = "NextLaunchJSON.json"
    }
    
    static func decode<T: Decodable>(file: Files = .nextLaunch) -> T? {
        guard let path = Bundle(for: RefBundle.self).url(
            forResource: file.rawValue, withExtension: nil
        ) else { return nil }
        
        do {
            let data = try Data(contentsOf: path)
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            return nil
        }
    }
}
