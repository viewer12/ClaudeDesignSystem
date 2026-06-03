import SwiftUI

/// Single-line text field with label, helper text, and error state.
public struct ClaudeTextField: View {
    var placeholder: String
    @Binding var text: String
    var label: String?
    var helperText: String?
    var errorText: String?
    var systemImage: String?

    @FocusState private var isFocused: Bool

    public init(
        _ placeholder: String,
        text: Binding<String>,
        label: String? = nil,
        helperText: String? = nil,
        errorText: String? = nil,
        systemImage: String? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.label = label
        self.helperText = helperText
        self.errorText = errorText
        self.systemImage = systemImage
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.xxs) {
            if let label {
                Text(label)
                    .font(ClaudeTypography.label)
                    .foregroundStyle(ClaudeColor.foreground)
            }
            HStack(spacing: ClaudeSpacing.xs) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .foregroundStyle(ClaudeColor.mutedForeground)
                }
                TextField(placeholder, text: $text)
                    .textFieldStyle(.plain)
                    .focused($isFocused)
                    .font(ClaudeTypography.body)
            }
            .padding(.horizontal, ClaudeSpacing.sm)
            .frame(height: 40)
            .background(ClaudeColor.background)
            .overlay(
                RoundedRectangle(cornerRadius: ClaudeRadius.md, style: .continuous)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: ClaudeRadius.md, style: .continuous))
            .animation(ClaudeMotion.fast, value: isFocused)

            if let errorText {
                Text(errorText)
                    .font(ClaudeTypography.caption)
                    .foregroundStyle(ClaudeColor.destructive)
            } else if let helperText {
                Text(helperText)
                    .font(ClaudeTypography.caption)
                    .foregroundStyle(ClaudeColor.mutedForeground)
            }
        }
    }

    private var borderColor: Color {
        if errorText != nil {
            return ClaudeColor.destructive
        }
        return isFocused ? ClaudeColor.ring : ClaudeColor.input
    }
}

