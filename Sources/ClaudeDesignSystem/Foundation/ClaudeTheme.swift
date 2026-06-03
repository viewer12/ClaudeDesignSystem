import SwiftUI

/// Theme container that applications can override to tune the system.
///
/// All semantic tokens (`ClaudeColor`, `ClaudeTypography`, ...) work without
/// a theme being installed; this is the seam for branding overrides.
public struct ClaudeTheme: Equatable {
    public var accentColor: Color
    public var cornerRadius: CGFloat
    public var spacing: CGFloat

    public init(
        accentColor: Color = ClaudeColor.primary,
        cornerRadius: CGFloat = ClaudeRadius.md,
        spacing: CGFloat = ClaudeSpacing.md
    ) {
        self.accentColor = accentColor
        self.cornerRadius = cornerRadius
        self.spacing = spacing
    }

    public static let `default` = ClaudeTheme()
}

private struct ClaudeThemeKey: EnvironmentKey {
    static let defaultValue: ClaudeTheme = .default
}

public extension EnvironmentValues {
    var claudeTheme: ClaudeTheme {
        get { self[ClaudeThemeKey.self] }
        set { self[ClaudeThemeKey.self] = newValue }
    }
}

public extension View {
    /// Install a `ClaudeTheme` for the view hierarchy.
    func claudeTheme(_ theme: ClaudeTheme) -> some View {
        environment(\.claudeTheme, theme)
            .tint(theme.accentColor)
    }
}
