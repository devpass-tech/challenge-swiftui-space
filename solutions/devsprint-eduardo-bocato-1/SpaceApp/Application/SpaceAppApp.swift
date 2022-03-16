import SwiftUI

@main
struct SpaceAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScene(
                viewModel: .init(
                    initialState: .init(),
                    environment: .init(launchService: LaunchServiceImplementation())
                )
            )
        }
    }
}
