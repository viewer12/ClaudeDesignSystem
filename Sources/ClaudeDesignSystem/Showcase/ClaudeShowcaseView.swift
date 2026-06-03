import SwiftUI

/// One-screen showcase of every component and token in the system.
///
/// Drop this into any SwiftUI hierarchy to inspect the design system visually
/// in a Xcode Preview or in a demo target:
///
/// ```swift
/// import ClaudeDesignSystem
///
/// @main
/// struct DemoApp: App {
///     var body: some Scene {
///         WindowGroup { ClaudeShowcaseView() }
///     }
/// }
/// ```
public struct ClaudeShowcaseView: View {

    @State private var name = ""
    @State private var email = "claude@anthropic.com"
    @State private var search = ""

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: ClaudeSpacing.xl) {
                header
                colorSection
                typographySection
                buttonsSection
                inputsSection
                cardsSection
                badgesSection
                chatSection
                codeBlockSection
                toastsSection
            }
            .padding(ClaudeSpacing.lg)
            .frame(maxWidth: 720, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .background(ClaudeColor.background)
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.xs) {
            HStack(spacing: ClaudeSpacing.sm) {
                ClaudeAvatar(systemImage: "sparkles", size: 48)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Claude Design System")
                        .font(ClaudeTypography.title1)
                        .foregroundStyle(ClaudeColor.foreground)
                    Text("SwiftUI · v0.1")
                        .font(ClaudeTypography.bodySmall)
                        .foregroundStyle(ClaudeColor.mutedForeground)
                }
            }
            Text("A native SwiftUI implementation of Claude's visual language. Token-first, theme-able, and built on Apple's HIG primitives.")
                .font(ClaudeTypography.body)
                .foregroundStyle(ClaudeColor.mutedForeground)
        }
    }

    // MARK: - Sections

    private var colorSection: some View {
        sectionContainer("Colors") {
            VStack(alignment: .leading, spacing: ClaudeSpacing.sm) {
                Text("Semantic")
                    .font(ClaudeTypography.label)
                    .foregroundStyle(ClaudeColor.mutedForeground)
                swatchRow([
                    ("primary", ClaudeColor.primary),
                    ("secondary", ClaudeColor.secondary),
                    ("destructive", ClaudeColor.destructive),
                    ("success", ClaudeColor.success),
                    ("warning", ClaudeColor.warning),
                    ("info", ClaudeColor.info)
                ])
                Text("Surfaces")
                    .font(ClaudeTypography.label)
                    .foregroundStyle(ClaudeColor.mutedForeground)
                    .padding(.top, ClaudeSpacing.xs)
                swatchRow([
                    ("background", ClaudeColor.background),
                    ("card", ClaudeColor.card),
                    ("popover", ClaudeColor.popover),
                    ("muted", ClaudeColor.muted),
                    ("accent", ClaudeColor.accent),
                    ("border", ClaudeColor.border)
                ])
            }
        }
    }

    private var typographySection: some View {
        sectionContainer("Typography") {
            VStack(alignment: .leading, spacing: ClaudeSpacing.xs) {
                Text("Display — serif").font(ClaudeTypography.display)
                Text("Title 1 — serif").font(ClaudeTypography.title1)
                Text("Title 2").font(ClaudeTypography.title2)
                Text("Title 3").font(ClaudeTypography.title3)
                Text("Title 4").font(ClaudeTypography.title4)
                Text("Body — the quick brown fox jumps over the lazy dog.")
                    .font(ClaudeTypography.body)
                Text("Body small — secondary copy.")
                    .font(ClaudeTypography.bodySmall)
                    .foregroundStyle(ClaudeColor.mutedForeground)
                Text("CAPTION").font(ClaudeTypography.caption.smallCaps())
                    .foregroundStyle(ClaudeColor.mutedForeground)
                Text("let x = 1").font(ClaudeTypography.code)
            }
            .foregroundStyle(ClaudeColor.foreground)
        }
    }

    private var buttonsSection: some View {
        sectionContainer("Buttons") {
            VStack(alignment: .leading, spacing: ClaudeSpacing.sm) {
                HStack(spacing: ClaudeSpacing.xs) {
                    Button("Primary") {}.buttonStyle(.claude(variant: .primary))
                    Button("Secondary") {}.buttonStyle(.claude(variant: .secondary))
                    Button("Outline") {}.buttonStyle(.claude(variant: .outline))
                }
                HStack(spacing: ClaudeSpacing.xs) {
                    Button("Ghost") {}.buttonStyle(.claude(variant: .ghost))
                    Button("Destructive") {}.buttonStyle(.claude(variant: .destructive))
                }
                HStack(spacing: ClaudeSpacing.xs) {
                    Button("Small") {}.buttonStyle(.claude(size: .small))
                    Button("Medium") {}.buttonStyle(.claude(size: .medium))
                    Button("Large") {}.buttonStyle(.claude(size: .large))
                }
                Button {
                } label: {
                    Label("Continue", systemImage: "arrow.right")
                }
                .buttonStyle(.claude(variant: .primary, size: .large, fullWidth: true))
            }
        }
    }

    private var inputsSection: some View {
        sectionContainer("Inputs") {
            VStack(alignment: .leading, spacing: ClaudeSpacing.md) {
                ClaudeTextField(
                    "Your name",
                    text: $name,
                    label: "Name",
                    helperText: "How you'd like to be addressed.",
                    systemImage: "person"
                )
                ClaudeTextField(
                    "you@example.com",
                    text: $email,
                    label: "Email",
                    systemImage: "envelope"
                )
                ClaudeTextField(
                    "Search…",
                    text: $search,
                    systemImage: "magnifyingglass"
                )
            }
        }
    }

    private var cardsSection: some View {
        sectionContainer("Cards") {
            ClaudeCard {
                VStack(alignment: .leading, spacing: ClaudeSpacing.sm) {
                    ClaudeCardHeader(
                        title: "Project Apollo",
                        subtitle: "Last updated 2 hours ago"
                    )
                    Text("A retrieval-augmented assistant for technical documentation, built end-to-end on Claude.")
                        .font(ClaudeTypography.body)
                        .foregroundStyle(ClaudeColor.cardForeground)
                    HStack {
                        ClaudeBadge("Active", variant: .success, systemImage: "circle.fill")
                        ClaudeBadge("v0.4")
                        Spacer()
                        Button("Open") {}.buttonStyle(.claude(variant: .primary, size: .small))
                    }
                }
            }
        }
    }

    private var badgesSection: some View {
        sectionContainer("Badges") {
            VStack(alignment: .leading, spacing: ClaudeSpacing.xs) {
                HStack(spacing: ClaudeSpacing.xs) {
                    ClaudeBadge("Primary", variant: .primary)
                    ClaudeBadge("Secondary")
                    ClaudeBadge("Outline", variant: .outline)
                }
                HStack(spacing: ClaudeSpacing.xs) {
                    ClaudeBadge("Live", variant: .success, systemImage: "circle.fill")
                    ClaudeBadge("Warn", variant: .warning)
                    ClaudeBadge("Error", variant: .danger)
                    ClaudeBadge("Info", variant: .info)
                }
            }
        }
    }

    private var chatSection: some View {
        sectionContainer("Chat") {
            VStack(spacing: ClaudeSpacing.sm) {
                ClaudeChatBubble(role: .user) {
                    Text("Can you help me build a SwiftUI design system?")
                }
                ClaudeChatBubble(role: .assistant) {
                    Text("Absolutely — let's start by establishing token primitives, then layer semantic tokens on top.")
                }
                HStack {
                    ClaudeTypingIndicator()
                    Spacer()
                }
            }
        }
    }

    private var codeBlockSection: some View {
        sectionContainer("Code") {
            ClaudeCodeBlock(
                """
                struct Greeting: View {
                    var body: some View {
                        Text("Hello, Claude")
                            .font(ClaudeTypography.title2)
                            .foregroundStyle(ClaudeColor.primary)
                    }
                }
                """,
                language: "swift"
            )
        }
    }

    private var toastsSection: some View {
        sectionContainer("Toasts") {
            VStack(spacing: ClaudeSpacing.xs) {
                ClaudeToast("Project saved", message: "Synced 3 seconds ago.", kind: .success)
                ClaudeToast("Heads up", message: "You're near your usage cap.", kind: .warning)
                ClaudeToast("Failed to send", message: "Check your connection.", kind: .error)
            }
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func sectionContainer<C: View>(_ title: String, @ViewBuilder content: () -> C) -> some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.sm) {
            Text(title)
                .font(ClaudeTypography.title3)
                .foregroundStyle(ClaudeColor.foreground)
            content()
        }
    }

    private func swatchRow(_ swatches: [(String, Color)]) -> some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.xxs) {
            ForEach(0..<swatches.count, id: \.self) { i in
                HStack(spacing: ClaudeSpacing.xs) {
                    RoundedRectangle(cornerRadius: ClaudeRadius.sm, style: .continuous)
                        .fill(swatches[i].1)
                        .overlay(
                            RoundedRectangle(cornerRadius: ClaudeRadius.sm, style: .continuous)
                                .stroke(ClaudeColor.border, lineWidth: 1)
                        )
                        .frame(width: 28, height: 28)
                    Text(swatches[i].0)
                        .font(ClaudeTypography.bodySmall)
                        .foregroundStyle(ClaudeColor.foreground)
                }
            }
        }
    }
}

