import SwiftUI

/// warm chili-pepper orange on deep kitchen olive
enum Theme {
    static let accent = Color(red: 0.9098, green: 0.3647, blue: 0.1725)
    static let accentSecondary = Color(red: 0.1725, green: 0.2431, blue: 0.1765)
    static let background = Color(red: 0.1647, green: 0.1294, blue: 0.0902)
    static let cardBackground = background.opacity(0.6)

    static let titleFont = Font.system(.title2, design: .rounded).weight(.bold)
    static let headlineFont = Font.system(.headline, design: .rounded)
    static let bodyFont = Font.system(.body, design: .rounded)
    static let captionFont = Font.system(.caption, design: .rounded)

    static let cornerRadius: CGFloat = 16
}
