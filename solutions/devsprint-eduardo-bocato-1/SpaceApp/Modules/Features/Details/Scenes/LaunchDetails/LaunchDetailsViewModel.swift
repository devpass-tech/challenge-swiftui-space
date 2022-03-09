import Foundation
import SwiftUI

// MARK: - State

struct DetailsState: Equatable {
    var details: Launch = Launch(
        id: "",
        name: ""
    )
}

// MARK: - Environment

struct DetailsEnvironment {
    // what should go in here?
    let someDetailsAPI: API
}

// MARK: - ViewModel

@dynamicMemberLookup
final class DetailsViewModel: ObservableObject {
    // MARK: - Properties

    @Published private(set) var state: DetailsState

    // MARK: - Dependencies

    private let environment: DetailsEnvironment

    // MARK: - Initialization

    init(
        initialState: DetailsState,
        environment: DetailsEnvironment
    ) {
        self.state = initialState
        self.environment = environment
    }

    // MARK: - Public API

    func triggerAction_NotSureWhatYet() {
        environment.someDetailsAPI.triggerSomeStateChange()
    }
}
protocol API {
    func triggerSomeStateChange()
}

final class SomeDetailsAPI: API {

    init() {}

    func triggerSomeStateChange()  {
        print("state changed")
    }
}

extension DetailsViewModel {
    subscript<T>(dynamicMember keyPath: KeyPath<DetailsState, T>) -> T {
        state[keyPath: keyPath]
    }
}
