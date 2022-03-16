import SwiftUI

#if DEBUG
enum PreviewSquareSize: CGFloat {
    /// width = 400
    case medium = 400
}

extension View {
    /// Reshapes view into square in a specified color scheme. Use in previews.
    func previewSquare(
        of size: PreviewSquareSize = .medium,
        _ colorScheme: ColorScheme
    ) -> some View {
        self
            .preferredColorScheme(colorScheme)
            .frame(width: size.rawValue, height: size.rawValue)
            .previewLayout(.sizeThatFits)
    }
}
#endif
