//
//  LaunchViewModel.swift
//  SpaceApp
//
//  Created by Paolo Prodossimo Lopes on 03/05/22.
//

import Foundation

final class LaunchViewModel: SPXViewModelActor, ObservableObject {
    
    //MARK: - Propertie
    
    @Published private(set) var launches: [LaunchesViewData] = []
    @Published var shouldShowView: Bool = false
    
    private let service: SpaceXAPIProtocol
    
    //MARK: - Constructor
    init(service: SpaceXAPIProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func start() {
        fetchLaunches()
    }
    
    //MARK: - Helpers
    private func fetchLaunches() {
        Task { [weak self] in
            guard let self = self else { return }
            let result = await service.fetchNextLaunches()
            self.launches = result?.docs?.map(LaunchesViewData.init) ?? []
        }
    }
}
