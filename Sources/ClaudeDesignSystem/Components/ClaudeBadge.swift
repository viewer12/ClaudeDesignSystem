import SwiftUI

public enum ClaudeBadgeVariant {
    case primary
    case secondary
    case success
    case warning
    case danger
    case info
    case outline
}

/// Small pill-shaped label for status, counts, and tags.
public struct ClaudeBadge: View {
    var text: String
    var variant: ClaudeBadgeVariant
    var systemImage: String?

    public init(
        _ text: String,
        variant: ClaudeBadgeVariant = .secondary,
        systemImage: String? = nil
    ) {
        self.text = text
        self.variant = variant
        self.systemImage = systemImage
    }

    public var body: some View {
        HStack(spacing: 4) {
            if let systemImage {
                Image(systemName: systemImage)
                    .font(.system(size: 10, weight: .semibold))
            }
            Text(text)
        }
        .font(ClaudeTypography.caption.weight(.medium))
        .padding(.horizontal, ClaudeSpacing.xs)
        .padding(.vertical, 3)
        .foregroundStyle(foreground)
        .background(background)
        .overlay(borderOverlay)
        .clipShape(Capsule())
    }

    private var background: Color {
        switch variant {
        case .primary: return ClaudeColor.primary
        case .secondary: return ClaudeColor.secondary
        case .success: return ClaudeColor.success
        case .warning: return ClaudeColor.warning
        case .danger: return ClaudeColor.destructive
        case .info: return ClaudeColor.info
        case .outline: return .clear
        }
    }

    private var foreground: Color {
        switch variant {
        case .primary: return ClaudeColor.primaryForeground
        case .secondary: return ClaudeColor.secondaryForeground
        case .success: return ClaudeColor.successForeground
        case .warning: return ClaudeColor.warningForeground
        case .danger: return ClaudeColor.destructiveForeground
        case .info: return ClaudeColor.infoForeground
        case .outline: return ClaudeColor.foreground
        }
    }

    @ViewBuilder
    private var borderOverlay: some View {
        if variant == .outline {
            Capsule().stroke(ClaudeColor.border, lineWidth: 1)
        }
    }
}

