//
//  HomeViewModel.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 27/04/22.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    //MARK: - Propertie
    private let service: SpaceXAPIProtocol
    
    @Published private(set) var launchs: [Launch] = []
    @Published private(set) var nextLaunch: NextLaunchViewData?
    
    //MARK: - Constructor
    init(service: SpaceXAPIProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func start() {
        fetchAllLaunch()
        fetchNextLaunch()
    }
    
    //MARK: - Helpers
    private func fetchAllLaunch() {
        Task { [weak self] in
            guard let self = self else { return }
            let allLaunchs = await service.fetchAllLaunches() ?? []
            DispatchQueue.main.async { self.launchs = allLaunchs }
        }
    }
    
    private func fetchNextLaunch() {
        Task { [weak self] in
            guard let self = self else { return }
            let nextLaunch = await service.fetchNextLaunch()
            DispatchQueue.main.async { self.nextLaunch = .init(nextLaunchResponse: nextLaunch) }
        }
    }
}

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
        let pth = nextLaunchResponse?.links.patch.small ?? ""
        return URL(string: pth)!
    }
    
    var description: String {
        nextLaunchResponse?.detail ?? .emptyString
    }
}

extension String {
    
    static var emptyString: String { "" }
    
    var dateFormattedFromUTC: String {
        let fromFormatter: DateFormatter = .init()
        fromFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        fromFormatter.timeZone = .init(abbreviation: "UTC")
        
        let date = fromFormatter.date(from: self) ?? Date()
        
        let toFormatter: DateFormatter = .init()
        toFormatter.dateFormat = "MMMM d, yyyy"
        
        return toFormatter.string(from: date)
    }
}

extension Int {
    var asLaunchCode: String { "#\(self)" }
}
