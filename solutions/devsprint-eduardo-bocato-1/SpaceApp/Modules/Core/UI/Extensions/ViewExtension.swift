import SwiftUI

#if DEBUG
extension View {
    /// Reshapes view into square in a specified color scheme. Use in previews.
    func previewSquare(_ colorScheme: ColorScheme) -> some View {
        self
            .preferredColorScheme(colorScheme)
            .frame(width: Constants.preview_square_size, height: Constants.preview_square_size)
            .previewLayout(.sizeThatFits)
    }
}
#endif
