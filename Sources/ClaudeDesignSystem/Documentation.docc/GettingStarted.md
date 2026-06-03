# Getting Started

Install, theme, and ship a Claude-style screen in five minutes.

## Install

Add the package as a Swift Package Manager dependency.

```swift
.package(url: "https://github.com/YOUR_ORG/ClaudeDesignSystem", from: "0.1.0")
```

## The token layer

Every visual decision in your UI should reach for a token, never a literal.

```swift
import ClaudeDesignSystem

Text("Hi")
    .font(ClaudeTypography.title2)
    .foregroundStyle(ClaudeColor.foreground)
    .padding(ClaudeSpacing.md)
    .background(
        RoundedRectangle(cornerRadius: ClaudeRadius.lg)
            .fill(ClaudeColor.card)
    )
```

The three tiers:

- **Primitive** — ``ClaudeColorPrimitive``: raw brand hues. Reach for these only inside the token layer.
- **Semantic** — ``ClaudeColor``: intent (`primary`, `muted`, `destructive`). *This is what components use.* Adapts to light/dark automatically.
- **Component** — local overrides inside a `ButtonStyle` or `ViewModifier`. Built from semantic tokens.

## Adopt a theme

Install a ``ClaudeTheme`` near the root of your view hierarchy. Components
respect the theme's `accentColor` through SwiftUI's native `tint`.

```swift
ContentView()
    .claudeTheme(
        ClaudeTheme(
            accentColor: ClaudeColorPrimitive.olive,
            cornerRadius: ClaudeRadius.lg
        )
    )
```

## Accessibility

The system is built with accessibility in mind from the token layer up.

- **Dynamic Type**: every typography token maps to a `Font.TextStyle`, so text scales with the user's preference.
- **Reduce Motion**: ``ClaudeTypingIndicator`` automatically pauses its animation when the user enables Reduce Motion.
- **VoiceOver**: visual-only components like ``ClaudeAvatar`` and ``ClaudeChatBubble`` ship sensible accessibility labels by default.
- **Dark Mode**: every ``ClaudeColor`` token pairs a light and a dark value at the token layer.

## See it all

Render ``ClaudeShowcaseView`` to inspect every token and component on one screen.
