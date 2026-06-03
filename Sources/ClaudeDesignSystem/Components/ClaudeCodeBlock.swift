import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Monospaced code surface with optional language label and copy button.
///
/// Mirrors Claude.ai's code block: a muted header strip carrying language
/// metadata and a copy action, with horizontally scrollable code body.
public struct ClaudeCodeBlock: View {
    var code: String
    var language: String?

    @State private var didCopy = false

    public init(_ code: String, language: String? = nil) {
        self.code = code
        self.language = language
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            ScrollView(.horizontal, showsIndicators: false) {
                Text(code)
                    .font(ClaudeTypography.code)
                    .foregroundStyle(ClaudeColor.foreground)
                    .padding(ClaudeSpacing.md)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .background(ClaudeColor.card)
        .overlay(
            RoundedRectangle(cornerRadius: ClaudeRadius.lg, style: .continuous)
                .stroke(ClaudeColor.border, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: ClaudeRadius.lg, style: .continuous))
    }

    private var header: some View {
        HStack {
            Text(language ?? "plaintext")
                    .font(ClaudeTypography.caption)
                    .foregroundStyle(ClaudeColor.mutedForeground)
                Spacer()
                Button {
                    copyToClipboard()
                } label: {
                    Label(
                        didCopy ? "Copied" : "Copy",
                        systemImage: didCopy ? "checkmark" : "doc.on.doc"
                    )
                    .labelStyle(.titleAndIcon)
                    .font(ClaudeTypography.caption)
                }
                .buttonStyle(.claude(variant: .ghost, size: .small))
                .accessibilityHint("Copies the code block to the clipboard.")
            }
        .padding(.horizontal, ClaudeSpacing.sm)
        .padding(.vertical, 6)
        .background(ClaudeColor.muted)
        .overlay(alignment: .bottom) {
            Rectangle().fill(ClaudeColor.border).frame(height: 1)
        }
    }

    private func copyToClipboard() {
        #if os(iOS) || os(visionOS)
        UIPasteboard.general.string = code
        #elseif os(macOS)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(code, forType: .string)
        #endif
        withAnimation(ClaudeMotion.fast) { didCopy = true }
        Task {
            try? await Task.sleep(nanoseconds: 1_500_000_000)
            withAnimation(ClaudeMotion.fast) { didCopy = false }
        }
    }
}

