import SwiftUI

struct LoadingView: View {
    let message: String?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            ProgressView()
            if let message = message {
                Text(message)
                    .padding()
            }
            Spacer()
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
