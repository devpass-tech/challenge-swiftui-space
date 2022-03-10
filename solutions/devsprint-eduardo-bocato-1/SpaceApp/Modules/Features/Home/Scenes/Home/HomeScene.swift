import Foundation
import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: HomeViewModel
    @State var tabSelected = 1
    
    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        TabView(selection: $tabSelected) {
            sceneForTab(SpaceApp.HomeScene.homeTitle) {
                VStack {
                    Text(SpaceApp.HomeScene.homeTitle)
                }
            }.tabItem {
                Label(SpaceApp.HomeScene.homeTitle, systemImage: "house.fill").tag(1)
            }

            sceneForTab(SpaceApp.Common.appTitle) {
                List(viewModel.launches) { launch in
                    Text("\(launch.name)")
                }
                .onAppear { viewModel.loadLaunches() }
            }.tabItem {
                Label(SpaceApp.HomeScene.launchesTitle, systemImage: "location.north.fill").tag(2)
            }
        }.onChange(of: tabSelected) { _ in }
    }


    @ViewBuilder
    private func sceneForTab<Content: View>(_ title: LocalizedStringKey, content: () -> Content) -> some View {
        NavigationView {
             content()
            .navigationTitle(title)
        }.navigationViewStyle(.stack)
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
