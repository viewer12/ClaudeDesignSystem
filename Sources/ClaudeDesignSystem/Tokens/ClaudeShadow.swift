import SwiftUI

/// Shadow tokens.
///
/// Claude's surfaces lean on border + color contrast rather than drop shadows.
/// These are intentionally minimal; reach for `.popover` only on overlays.
public struct ClaudeShadow {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public init(color: Color, radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }

    /// No shadow — preferred for inline surfaces.
    public static let none = ClaudeShadow(color: .clear, radius: 0)

    /// Subtle elevation — hover states.
    public static let xs = ClaudeShadow(
        color: .black.opacity(0.04),
        radius: 2,
        y: 1
    )

    /// Floating elements — popovers, tooltips.
    public static let sm = ClaudeShadow(
        color: .black.opacity(0.06),
        radius: 6,
        y: 2
    )

    /// Modal dialogs, sheets.
    public static let md = ClaudeShadow(
        color: .black.opacity(0.10),
        radius: 16,
        y: 6
    )
}

public extension View {
    /// Apply a `ClaudeShadow` token.
    func claudeShadow(_ shadow: ClaudeShadow) -> some View {
        self.shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
    }
}
