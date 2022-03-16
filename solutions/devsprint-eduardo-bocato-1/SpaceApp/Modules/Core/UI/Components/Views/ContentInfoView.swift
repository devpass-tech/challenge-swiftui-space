import SwiftUI

public struct ContentInfoView: View {
    private let text: String
    private let retryAction: (() -> Void)?

    public init(
        text: String,
        retryAction: (() -> Void)? = nil
    ) {
        self.text = text
        self.retryAction = retryAction
    }

    public var body: some View {
        VStack {
            Spacer()
            Text(text)
            if let retryAction = retryAction {
                Button("Retry") {
                    retryAction()
                }
                .foregroundColor(.white)
                .newDsPadding(.xxSmall)
                .background(Color.blue)
                .newDsCornerRadius(.xxSmall)
            }
            Spacer()
        }
    }
}

#if DEBUG
struct ContentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentInfoView(
            text: "Something wrong, it's empty!",
            retryAction: {}
        )
        .preferredColorScheme(.light)

        ContentInfoView(
            text: "Something wrong, it's empty!",
            retryAction: {}
        )
        .preferredColorScheme(.dark)
    }
}

#endif
