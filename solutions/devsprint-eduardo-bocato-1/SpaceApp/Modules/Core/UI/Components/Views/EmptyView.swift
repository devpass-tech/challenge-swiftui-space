import SwiftUI

public struct EmptyView: View {
    private let text: String

    public init(text: String) {
        self.text = text
    }

    public var body: some View {
        ContentInfoView(
            text: text,
            retryAction: nil
        )
    }
}

#if DEBUG
struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(text: "Something wrong, it's empty!")
            .preferredColorScheme(.light)
        EmptyView(text: "Something wrong, it's empty!")
            .preferredColorScheme(.dark)
    }
}
#endif

