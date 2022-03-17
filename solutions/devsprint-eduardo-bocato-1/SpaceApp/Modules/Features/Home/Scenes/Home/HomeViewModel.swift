import Foundation
import SwiftUI

// MARK: - State

struct HomeState: Equatable {
    var launches: [Launch] = []
    var selectedTabIndex: HomeTabs = .home
    var errorMessage: String?
}

// MARK: - Environment

struct HomeEnvironment {
    let spaceXAPI: SpaceXAPI
}

// MARK: - ViewModel

@dynamicMemberLookup
final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: HomeState
    
    // MARK: - Dependencies
    
    private let environment: HomeEnvironment
    
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
        environment.spaceXAPI.fetchAllLaunches { launches in
            guard let launches = launches else {
                self.state.errorMessage = ""
                return
            }

            self.state.launches = launches
        }
    }
}

extension HomeViewModel {
    subscript<T>(dynamicMember keyPath: KeyPath<HomeState, T>) -> T {
        state[keyPath: keyPath]
    }
}
