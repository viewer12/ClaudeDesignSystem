#  ``ClaudeDesignSystem``

A SwiftUI-native design system inspired by Anthropic's Claude visual language.

## Overview

ClaudeDesignSystem provides a token-first, theme-able foundation for building
Claude-style interfaces on iOS, macOS, watchOS, tvOS, and visionOS. It is
built on Apple's native primitives — `ButtonStyle`, `Material`, SF Symbols,
Dynamic Type — and adds a layer of semantic tokens and ready-made components.

```swift
import SwiftUI
import ClaudeDesignSystem

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.md) {
            Text("Welcome to Claude")
                .font(ClaudeTypography.title1)
                .foregroundStyle(ClaudeColor.foreground)

            ClaudeTextField("Your name", text: $name, label: "Name")

            Button("Continue") { }
                .buttonStyle(.claude(variant: .primary, size: .large, fullWidth: true))
        }
        .padding(ClaudeSpacing.lg)
        .background(ClaudeColor.background)
    }
}
```

## Topics

### Getting started

- <doc:GettingStarted>

### Tokens

- ``ClaudeColor``
- ``ClaudeColorPrimitive``
- ``ClaudeTypography``
- ``ClaudeSpacing``
- ``ClaudeRadius``
- ``ClaudeMotion``
- ``ClaudeShadow``

### Theming

- ``ClaudeTheme``

### Components

- ``ClaudeButtonStyle``
- ``ClaudeCard``
- ``ClaudeCardHeader``
- ``ClaudeChatBubble``
- ``ClaudeTypingIndicator``
- ``ClaudeAvatar``
- ``ClaudeBadge``
- ``ClaudeTextField``
- ``ClaudeCodeBlock``
- ``ClaudeToast``
- ``ClaudeDivider``

### Showcase

- ``ClaudeShowcaseView``
