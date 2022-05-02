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
    
    //MARK: - Constructor
    init(service: SpaceXAPIProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func start() {
        fetchAllLaunch()
    }
    
    //MARK: - Helpers
    private func fetchAllLaunch() {
        Task { [weak self] in
            guard let self = self else { return }
            let allLaunchs = await service.fetchAllLaunches() ?? []
            DispatchQueue.main.async { self.launchs = allLaunchs }
        }
    }
}

