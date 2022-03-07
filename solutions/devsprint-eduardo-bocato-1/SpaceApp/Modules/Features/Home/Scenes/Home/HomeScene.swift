import Foundation
import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.launches) { launch in
                Text("\(launch.name)")
            }
            .onAppear { viewModel.loadLaunches() }
            .navigationTitle("Space App 🚀")
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
