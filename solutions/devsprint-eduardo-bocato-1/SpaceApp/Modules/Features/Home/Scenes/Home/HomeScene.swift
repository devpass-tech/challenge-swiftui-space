import Foundation
import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        TabView {
            homeScene()
                .tabItem {
                    Label("homescene_home_tab_title", systemImage: "house.fill")
                }
            launchesScene()
                .tabItem {
                    Label("homescene_launches_tab_title", systemImage: "location.north.fill")
                }
        }
    }

    // TODO: Check what scene will be show for Launches tab
    @ViewBuilder
    private func launchesScene() -> some View {
        NavigationView {
            List(viewModel.launches) { launch in
                Text("\(launch.name)")
            }
            .onAppear { viewModel.loadLaunches() }
            .navigationTitle("mainapp_title")
        }
    }

    // TODO: Check what scene will be show for Home tab
    @ViewBuilder
    private func homeScene() -> some View {
        NavigationView {
            VStack {
                Text("homescene_home_tab_title")
            }
            .navigationTitle("homescene_home_tab_title")
        }
    }
}

#if DEBUG
struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene(
            viewModel: .init(
                initialState: .init(),
                environment: .init(spaceXAPI: .init())
            )
        )
    }
}
#endif
