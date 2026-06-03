import SwiftUI

public enum ClaudeChatRole {
    case user
    case assistant
}

/// Chat message bubble.
///
/// User messages render as filled Clay bubbles aligned right; assistant
/// messages render as muted neutral bubbles aligned left. The 16pt radius
/// matches Claude's published bubble shape.
public struct ClaudeChatBubble<Content: View>: View {
    var role: ClaudeChatRole
    var content: Content

    public init(role: ClaudeChatRole, @ViewBuilder content: () -> Content) {
        self.role = role
        self.content = content()
    }

    public var body: some View {
        HStack(alignment: .bottom, spacing: ClaudeSpacing.xs) {
            if role == .user {
                Spacer(minLength: ClaudeSpacing.xxl)
            }
            content
                .font(ClaudeTypography.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, ClaudeSpacing.md)
                .padding(.vertical, ClaudeSpacing.sm)
                .background(bubbleColor)
                .clipShape(RoundedRectangle(cornerRadius: ClaudeRadius.xl, style: .continuous))
                .accessibilityElement(children: .combine)
                .accessibilityLabel(role == .user ? "You said" : "Claude said")
            if role == .assistant {
                Spacer(minLength: ClaudeSpacing.xxl)
            }
        }
    }

    private var bubbleColor: Color {
        switch role {
        case .user: return ClaudeColor.primary
        case .assistant: return ClaudeColor.muted
        }
    }

    private var textColor: Color {
        switch role {
        case .user: return ClaudeColor.primaryForeground
        case .assistant: return ClaudeColor.foreground
        }
    }
}

/// Three-dot streaming indicator — drop in place of an assistant bubble while
/// the model is generating.
///
/// Respects `\.accessibilityReduceMotion`: when reduce-motion is on, the dots
/// render statically rather than pulsing.
public struct ClaudeTypingIndicator: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isAnimating = false

    public init() {}

    public var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<3) { i in
                Circle()
                    .fill(ClaudeColor.mutedForeground)
                    .frame(width: 6, height: 6)
                    .scaleEffect(reduceMotion ? 0.8 : (isAnimating ? 1.0 : 0.6))
                    .opacity(reduceMotion ? 0.6 : (isAnimating ? 1.0 : 0.4))
                    .animation(
                        reduceMotion
                            ? nil
                            : .easeInOut(duration: 0.6)
                                .repeatForever()
                                .delay(0.15 * Double(i)),
                        value: isAnimating
                    )
            }
        }
        .padding(.horizontal, ClaudeSpacing.md)
        .padding(.vertical, ClaudeSpacing.sm)
        .background(ClaudeColor.muted)
        .clipShape(RoundedRectangle(cornerRadius: ClaudeRadius.xl, style: .continuous))
        .onAppear { isAnimating = true }
        .accessibilityElement()
        .accessibilityLabel("Claude is typing")
    }
}

