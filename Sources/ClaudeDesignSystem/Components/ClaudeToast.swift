import SwiftUI

public enum ClaudeToastKind {
    case info, success, warning, error

    var systemImage: String {
        switch self {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.octagon.fill"
        }
    }

    var tint: Color {
        switch self {
        case .info: return ClaudeColor.info
        case .success: return ClaudeColor.success
        case .warning: return ClaudeColor.warning
        case .error: return ClaudeColor.destructive
        }
    }
}

/// Toast-style notification banner. Use with a `@State` flag and `.transition`.
public struct ClaudeToast: View {
    var title: String
    var message: String?
    var kind: ClaudeToastKind

    public init(_ title: String, message: String? = nil, kind: ClaudeToastKind = .info) {
        self.title = title
        self.message = message
        self.kind = kind
    }

    public var body: some View {
        HStack(alignment: .top, spacing: ClaudeSpacing.sm) {
            Image(systemName: kind.systemImage)
                .foregroundStyle(kind.tint)
                .font(.system(size: 18, weight: .semibold))
                .padding(.top, 2)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(ClaudeTypography.label)
                    .foregroundStyle(ClaudeColor.popoverForeground)
                if let message {
                    Text(message)
                        .font(ClaudeTypography.bodySmall)
                        .foregroundStyle(ClaudeColor.mutedForeground)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(ClaudeSpacing.sm)
        .background(ClaudeColor.popover)
        .overlay(
            RoundedRectangle(cornerRadius: ClaudeRadius.md, style: .continuous)
                .stroke(ClaudeColor.border, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: ClaudeRadius.md, style: .continuous))
        .claudeShadow(.sm)
    }
}

