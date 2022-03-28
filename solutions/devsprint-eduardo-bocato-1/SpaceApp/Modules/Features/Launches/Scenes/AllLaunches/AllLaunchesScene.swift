import SwiftUI
import Combine

typealias LaunchViewData = Launch
enum ViewState: Equatable {
    case data([LaunchViewData])
    case error(String)
    case loading
    case empty
}

struct AllLaunchesState: Equatable {
    var launches: [Launch] = []
    var viewState: ViewState = .loading
}

protocol LaunchesServiceProtocol {
    func getLaunches() -> AnyPublisher<[Launch], NSError>
}

struct LaunchesService: LaunchesServiceProtocol { // MOCKED!
    func getLaunches() -> AnyPublisher<[Launch], NSError> {
        let responseMock: [Launch] = [
            .init(id: "1", name: "First"),
            .init(id: "2", name: "Second"),
            .init(id: "3", name: "Third"),
            .init(id: "4", name: "Forth")
        ]
        let result: Result<[Launch], NSError> = .success(responseMock)
        return result.publisher.eraseToAnyPublisher()
    }
}

struct AllLaunchesEnvironment {
    var launchesService: LaunchesServiceProtocol
}

#if DEBUG
struct LaunchesServiceDummy: LaunchesServiceProtocol {
    func getLaunches() -> AnyPublisher<[Launch], NSError> {
        return Empty().eraseToAnyPublisher()
    }
}

extension AllLaunchesEnvironment {
    static func mocking(
        launchesService: LaunchesServiceProtocol = LaunchesServiceDummy()
    ) -> Self {
        .init(launchesService: launchesService)
    }
    
    static let dummy: Self = .mocking()
}
#endif

final class AllLaunchesViewModel: ObservableObject {
    // MARK: - Dependencies
    private let environment: AllLaunchesEnvironment
    
    // MARK: - Properties
    @Published var state: AllLaunchesState
    private var subscriptions: Set<AnyCancellable> = .init()
    
    init(
        initialState: AllLaunchesState,
        environment: AllLaunchesEnvironment
    ) {
        _state = .init(initialValue: initialState)
        self.environment = environment
    }
    
    func loadData() {
        state.viewState = .loading
        environment
            .launchesService
            .getLaunches()
            .sink(
                receiveCompletion: { [unowned self] completion in
                    if case let .failure(error) = completion {
                        self.state.viewState = .error(error.localizedDescription)
                    }
                },
                receiveValue: { [unowned self] launches in
                    self.state.launches = launches
                    self.state.viewState = launches.isEmpty ? .empty : .data(launches)
                }
            )
            .store(in: &subscriptions)
    }
}

struct AllLaunchesScene: View {
    @StateObject var viewModel: AllLaunchesViewModel
    
    var body: some View {
        Group {
            switch viewModel.state.viewState {
            case .loading:
                Text("I am loading!")
            case let .data(launches):
                List {
                    ForEach(launches) { launch in
                        Text(launch.name)
                    }
                }
            case let .error(message):
                Text("Error: \(message)")
            case .empty:
                Text("Empty!")
            }
        }
        .onAppear { viewModel.loadData() }
    }
}

#if DEBUG
//struct AllLaunchesScene_Previews: PreviewProvider {
//    static var previews: some View {
//        AllLaunchesScene(
//            viewModel: .init(
//                initialState: .init(
//                    launches: [
//                        .init(id: "1", name: "First"),
//                        .init(id: "2", name: "Second"),
//                        .init(id: "3", name: "Third"),
//                        .init(id: "4", name: "Forth")
//                    ]
//                ),
//                environment: .dummy
//            )
//        )
//    }
//}
#endif
