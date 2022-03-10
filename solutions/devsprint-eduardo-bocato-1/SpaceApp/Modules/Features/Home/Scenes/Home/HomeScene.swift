import Foundation
import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: HomeViewModel
    @State private var tabSelected: Int = 1

    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        TabView(selection: $tabSelected) {

            NavigationSceneView(title: SpaceApp.HomeScene.homeTitle) {
                Text(SpaceApp.HomeScene.homeTitle)
            }.tabItem {
                Label(SpaceApp.HomeScene.homeTitle, systemImage: "house.fill")
            }.tag(1)

            NavigationSceneView(title: SpaceApp.Common.appTitle) {
                VStack {
                    List(viewModel.launches) { launch in
                        Text("\(launch.name)")
                    }
                    .onAppear { viewModel.loadLaunches() }
                }
            }.tabItem {
                Label(SpaceApp.HomeScene.launchesTitle, systemImage: "location.north.fill")
            }.tag(2)
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
                    environment: .init(spaceXAPI: .init())
                )
            ).preferredColorScheme(ColorScheme.dark)

            HomeScene(
                viewModel: .init(
                    initialState: .init(),
                    environment: .init(spaceXAPI: .init())
                )
            ).preferredColorScheme(ColorScheme.light)
        }
    }
}
#endif
