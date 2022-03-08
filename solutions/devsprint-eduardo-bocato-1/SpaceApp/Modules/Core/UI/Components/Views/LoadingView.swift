import SwiftUI

struct LoadingView: View {
    var message: String?
    
    var body: some View {
        VStack {
            ProgressView()
            if let message = message {
                Text(message)
                    .padding()
            }
        }
    }
}

#if DEBUG
struct LoadingView_Previews: PreviewProvider {
    static var textExample: String? = "Loading..."
    static var previews: some View {
        LoadingView(message: textExample)
    }
}
#endif
