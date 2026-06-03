import SwiftUI

/// Standard surface container with border, 12pt radius, and configurable padding.
public struct ClaudeCard<Content: View>: View {
    var padding: CGFloat
    var content: Content

    public init(
        padding: CGFloat = ClaudeSpacing.md,
        @ViewBuilder content: () -> Content
    ) {
        self.padding = padding
        self.content = content()
    }

    public var body: some View {
        content
            .padding(padding)
            .background(ClaudeColor.card)
            .overlay(
                RoundedRectangle(cornerRadius: ClaudeRadius.lg, style: .continuous)
                    .stroke(ClaudeColor.border, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: ClaudeRadius.lg, style: .continuous))
    }
}

/// Section header for cards. Pair with `ClaudeCard` for headed surfaces.
public struct ClaudeCardHeader: View {
    var title: String
    var subtitle: String?

    public init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.xxs) {
            Text(title)
                .font(ClaudeTypography.title4)
                .foregroundStyle(ClaudeColor.cardForeground)
            if let subtitle {
                Text(subtitle)
                    .font(ClaudeTypography.bodySmall)
                    .foregroundStyle(ClaudeColor.mutedForeground)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

