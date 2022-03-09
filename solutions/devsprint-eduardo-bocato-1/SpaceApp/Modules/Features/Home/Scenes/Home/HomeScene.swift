import Foundation
import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        TabView {
            sceneForTab("homescene_home_tab_title") {
                VStack {
                    Text("homescene_home_tab_title")
                }
            }.tabItem {
                Label("homescene_home_tab_title", systemImage: "house.fill")
            }
            sceneForTab("mainapp_title") {
                List(viewModel.launches) { launch in
                    Text("\(launch.name)")
                }
                .onAppear { viewModel.loadLaunches() }
            }.tabItem {
                    Label("homescene_launches_tab_title", systemImage: "location.north.fill")
            }
        }
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
        HomeScene(
            viewModel: .init(
                initialState: .init(),
                environment: .init(spaceXAPI: .init())
            )
        )
    }
}
#endif
