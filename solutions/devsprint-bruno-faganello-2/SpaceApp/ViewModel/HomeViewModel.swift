//
//  HomeViewModel.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 27/04/22.
//

import SwiftUI

final class HomeViewModel: SPXViewModelActor, ObservableObject {
    
    //MARK: - Propertie
    private let service: SpaceXAPIProtocol
    
    @Published private(set) var nextLaunch: NextLaunchViewData?
    
    //MARK: - Constructor
    init(service: SpaceXAPIProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func start() {
        fetchNextLaunch()
    }
    
    //MARK: - Helpers
    private func fetchNextLaunch() {
        Task { [weak self] in
            guard let self = self else { return }
            let nextLaunch = await service.fetchNextLaunch()
            self.serviceResultHandler(nextLaunch)
        }
    }
    
    private func serviceResultHandler(_ response: NextLaunchResponseModel?) {
        guard let nl = response else { self.nextLaunch = nil; return }
        self.nextLaunch = .init(nextLaunchResponse: nl)
    }
}
