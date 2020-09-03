import SwiftUI

extension Color {
    // Styles
    static let textPrimary = gray900
    static let textSecondary = gray500
    static let lightBackground = gray200
    static let foreignAccent = blue700
    static let nativeAccent = teal700

    // Colors
    static let gray200 = rgb(237, 242, 247)
    static let gray500 = rgb(160, 174 ,192)
    static let gray900 = rgb(26, 32, 44)
    static let blue700 = rgb(43, 108, 176)
    static let teal700 = rgb(44, 122, 123)

    private static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Self {
        Self(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0
        )
    }
}
