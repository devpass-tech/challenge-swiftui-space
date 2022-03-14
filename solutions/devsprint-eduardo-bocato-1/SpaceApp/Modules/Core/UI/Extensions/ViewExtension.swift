import SwiftUI

#if DEBUG
extension View {
    /// Reshapes view into square in a specified color scheme. Use in previews.
    func previewSquare(size: Constants.PreviewSquareSize = .medium, _ colorScheme: ColorScheme) -> some View {
        self
            .preferredColorScheme(colorScheme)
            .frame(width: size.rawValue, height: size.rawValue)
            .previewLayout(.sizeThatFits)
    }
}
#endif
