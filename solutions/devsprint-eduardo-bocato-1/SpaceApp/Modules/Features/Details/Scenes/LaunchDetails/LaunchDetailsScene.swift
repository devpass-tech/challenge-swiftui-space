import SwiftUI

struct LaunchDetailsScene: View {
    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack(spacing: 20) { // Magic Number 🧙🏻‍♂️ -> Avoid
            Text(viewModel.details.name)
                .font(.title)
            
            Button {
                viewModel.triggerAction_NotSureWhatYet()
            } label: {
                Text("GO!")
                    .font(.largeTitle)
            }
            .foregroundColor(.white)
//            .buttonStyle(.borderedProminent) -> iOS 15, let's change this
        }
    }
}

struct LaunchDetailsScene_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsScene(
            viewModel: DetailsViewModel(
                initialState: DetailsState(),
                environment: DetailsEnvironment(
                    someDetailsAPI: SomeDetailsAPI()
                )
            )
        )
    }
}
