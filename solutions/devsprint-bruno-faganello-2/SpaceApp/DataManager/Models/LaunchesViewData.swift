//
//  LaunchesViewData.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 03/05/22.
//

import Foundation

final class LaunchesViewData: Identifiable {
    
    private let response: NextLaunchesDocsResponseModel?
    
    init(_ response: NextLaunchesDocsResponseModel?) {
        self.response = response
    }
    
    let id: UUID = .init()
    
    var rocketName: String {
        response?.name ?? .emptyString
    }
    
    var launchNumber: String {
        let codeNumber = response?.flightNumber ?? .zero
        return codeNumber.asLaunchCode
    }
    
    var launchDate: String {
        let date = response?.date ?? .emptyString
        return date.dateFormattedFromUTC
    }
    
    var iconImageURL: URL {
        let pth = response?.links.patch.small ?? .emptyString
        return URL(string: pth)!
    }
}
