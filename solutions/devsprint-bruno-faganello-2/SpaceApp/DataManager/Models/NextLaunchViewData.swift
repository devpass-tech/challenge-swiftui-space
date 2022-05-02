//
//  NextLaunchViewData.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 26/04/22.
//

import Foundation

struct NextLaunchViewData: Identifiable {
    
    private let nextLaunchResponse: NextLaunchResponseModel?
    
    init(nextLaunchResponse: NextLaunchResponseModel?) {
        self.nextLaunchResponse = nextLaunchResponse
    }
    
    let id: UUID = .init()
    
    var rocketName: String {
        nextLaunchResponse?.aircraftName ?? .emptyString
    }
    
    var launchNumber: String {
        let codeNumber = nextLaunchResponse?.flightNumber ?? .zero
        return codeNumber.asLaunchCode
    }
    
    var launchDescription: String {
        nextLaunchResponse?.detail ?? .emptyString
    }
    
    var launchDate: String {
        let date = nextLaunchResponse?.launchDate ?? .emptyString
        return date.dateFormattedFromUTC
    }
    
    var iconImageURL: URL {
        let pth = nextLaunchResponse?.links.patch.small ?? .emptyString
        return URL(string: pth)!
    }
    
    var description: String {
        nextLaunchResponse?.detail ?? .emptyString
    }
}
