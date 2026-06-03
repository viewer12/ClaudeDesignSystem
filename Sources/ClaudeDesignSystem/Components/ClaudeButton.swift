import SwiftUI

// MARK: - Variants

public enum ClaudeButtonVariant {
    /// Filled Clay (primary CTA).
    case primary
    /// Subtle neutral fill.
    case secondary
    /// Bordered, transparent fill.
    case outline
    /// No border, no fill — text only with hover state.
    case ghost
    /// Crail red — for irreversible / destructive actions.
    case destructive
}

public enum ClaudeButtonSize {
    case small, medium, large

    var height: CGFloat {
        switch self {
        case .small: return 32
        case .medium: return 40
        case .large: return 48
        }
    }

    var horizontalPadding: CGFloat {
        switch self {
        case .small: return ClaudeSpacing.sm
        case .medium: return ClaudeSpacing.md
        case .large: return ClaudeSpacing.lg
        }
    }

    var font: Font {
        switch self {
        case .small: return ClaudeTypography.bodySmall.weight(.medium)
        case .medium: return ClaudeTypography.label
        case .large: return ClaudeTypography.body.weight(.medium)
        }
    }
}

// MARK: - Style

public struct ClaudeButtonStyle: ButtonStyle {
    var variant: ClaudeButtonVariant
    var size: ClaudeButtonSize
    var fullWidth: Bool

    public init(
        variant: ClaudeButtonVariant = .primary,
        size: ClaudeButtonSize = .medium,
        fullWidth: Bool = false
    ) {
        self.variant = variant
        self.size = size
        self.fullWidth = fullWidth
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(size.font)
            .padding(.horizontal, size.horizontalPadding)
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .frame(height: size.height)
            .foregroundStyle(foreground)
            .background(background(pressed: configuration.isPressed))
            .overlay(border)
            .clipShape(RoundedRectangle(cornerRadius: ClaudeRadius.md, style: .continuous))
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(ClaudeMotion.fast, value: configuration.isPressed)
    }

    @ViewBuilder
    private func background(pressed: Bool) -> some View {
        switch variant {
        case .primary:
            (pressed ? ClaudeColorPrimitive.antiqueBrass : ClaudeColor.primary)
        case .secondary:
            ClaudeColor.secondary
        case .outline:
            Color.clear
        case .ghost:
            pressed ? ClaudeColor.accent : Color.clear
        case .destructive:
            ClaudeColor.destructive
        }
    }

    private var foreground: Color {
        switch variant {
        case .primary: return ClaudeColor.primaryForeground
        case .secondary: return ClaudeColor.secondaryForeground
        case .outline: return ClaudeColor.foreground
        case .ghost: return ClaudeColor.foreground
        case .destructive: return ClaudeColor.destructiveForeground
        }
    }

    @ViewBuilder
    private var border: some View {
        if variant == .outline {
            RoundedRectangle(cornerRadius: ClaudeRadius.md, style: .continuous)
                .stroke(ClaudeColor.border, lineWidth: 1)
        }
    }
}

// MARK: - Sugar

public extension ButtonStyle where Self == ClaudeButtonStyle {
    /// Apply Claude's button style. Default is primary / medium.
    static func claude(
        variant: ClaudeButtonVariant = .primary,
        size: ClaudeButtonSize = .medium,
        fullWidth: Bool = false
    ) -> ClaudeButtonStyle {
        ClaudeButtonStyle(variant: variant, size: size, fullWidth: fullWidth)
    }
}

// MARK: - Preview
// In Xcode, preview by opening `ClaudeShowcaseView.swift` and clicking Resume,
// or by writing a `#Preview` block in your own app target.
