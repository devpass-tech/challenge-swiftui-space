import Combine
import Foundation
import SwiftUI

// MARK: - State

struct HomeState: Equatable {
    var launches: [Launch] = []
    var selectedTabIndex: HomeTabs = .home
}

// MARK: - Environment

struct HomeEnvironment {
//    let spaceXAPI: SpaceXAPI
    let launchService: LaunchServiceProtocol
}

// MARK: - ViewModel

@dynamicMemberLookup
final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: HomeState
    
    // MARK: - Dependencies
    
    private let environment: HomeEnvironment
    private var launchesServiceCancellable: AnyCancellable?

    // MARK: - Initialization
    
    init(
        initialState: HomeState,
        environment: HomeEnvironment
    ) {
        self.state = initialState
        self.environment = environment
    }
    
    // MARK: - Public API
    
    func loadLaunches() {
        launchesServiceCancellable = environment.launchService.fetchAllLaunches()
            .receive(on: DispatchQueue.main)
            .sink(
            receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print(error)
                }
            },
            receiveValue: { [weak self] in
                self?.state.launches = $0
            }
        )
    }
}

extension HomeViewModel {
    subscript<T>(dynamicMember keyPath: KeyPath<HomeState, T>) -> T {
        state[keyPath: keyPath]
    }
}
