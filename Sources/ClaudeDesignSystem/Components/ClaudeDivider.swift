import SwiftUI

/// Subtle horizontal or vertical divider drawn with the `border` token.
public struct ClaudeDivider: View {
    public enum Axis { case horizontal, vertical }

    var axis: Axis

    public init(_ axis: Axis = .horizontal) {
        self.axis = axis
    }

    public var body: some View {
        Group {
            switch axis {
            case .horizontal:
                Rectangle().frame(height: 1)
            case .vertical:
                Rectangle().frame(width: 1)
            }
        }
        .foregroundStyle(ClaudeColor.border)
    }
}
