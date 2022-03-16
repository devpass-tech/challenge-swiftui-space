import Foundation
import SwiftUI

enum HomeTabs: Int {
    case home
    case launches
}

struct HomeScene: View {
    @StateObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        TabView(selection: $viewModel.state.selectedTabIndex) {

            NavigationSceneView(title: L10n.HomeScene.homeTitle) {
                Text(L10n.HomeScene.homeTitle)
            }.tabItem {
                Label(L10n.HomeScene.homeTitle, systemImage: "house.fill")
            }.tag(HomeTabs.home)

            NavigationSceneView(title: L10n.Common.appTitle) {
                VStack {
                    List(viewModel.launches) { launch in
                        Text("\(launch.name)")
                    }
                    .onAppear { viewModel.loadLaunches() }
                }
            }.tabItem {
                Label(L10n.HomeScene.launchesTitle, systemImage: "location.north.fill")
            }.tag(HomeTabs.launches)
        }.onAppear {
            viewModel.loadLaunches()
        }
    }
}

#if DEBUG
struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeScene(
                viewModel: .init(
                    initialState: .init(),
                    environment: .init(launchService: LaunchServiceImplementation())
                )
            ).preferredColorScheme(ColorScheme.dark)

            HomeScene(
                viewModel: .init(
                    initialState: .init(),
                    environment: .init(launchService: LaunchServiceImplementation())
                )
            ).preferredColorScheme(ColorScheme.light)
        }
    }
}
#endif
