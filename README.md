<p align="right">
  <b>English</b> ·
  <a href="./README.zh-CN.md">简体中文</a> ·
  <a href="./README.ja.md">日本語</a>
</p>

# ClaudeDesignSystem for SwiftUI

A community-built, SwiftUI-native implementation of the visual language used by
Anthropic's Claude products — Book Cloth surfaces, Clay-orange accents, warm
neutrals, restrained motion, and a serif-display + sans-body type pairing.

> **Not affiliated with Anthropic.** This is an open-source design system
> *inspired by* the public visual language of Claude. The "Claude" name and
> brand marks belong to Anthropic, PBC. See [LICENSE](./LICENSE).

---

## Highlights

- **Pure SwiftUI** — no UIKit bridges, no third-party deps.
- **Three-tier token system** — Primitive → Semantic → Component, the OUDS / Atlassian / shadcn convention.
- **`background / foreground` naming** — the shadcn pairing convention, mapped to native SwiftUI.
- **Light & dark mode** — every semantic color adapts automatically via `UITraitCollection` / `NSAppearance`.
- **Multi-platform** — iOS 16+, macOS 13+, watchOS 9+, tvOS 16+, visionOS 1+.
- **Apple-native foundations** — built on `ButtonStyle`, `Material`, SF Symbols, Dynamic Type.
- **Drop-in showcase** — `ClaudeShowcaseView` renders every component in one screen.

---

## Installation

### Swift Package Manager (recommended)

In Xcode: **File → Add Package Dependencies…** and paste:

```
https://github.com/viewer12/ClaudeDesignSystem
```

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/viewer12/ClaudeDesignSystem", from: "0.1.0")
],
targets: [
    .target(name: "MyApp", dependencies: ["ClaudeDesignSystem"])
]
```

---

## Quick start

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

            ClaudeTextField(
                "Your name",
                text: $name,
                label: "Name",
                systemImage: "person"
            )

            Button("Continue") { /* … */ }
                .buttonStyle(.claude(variant: .primary, size: .large, fullWidth: true))
        }
        .padding(ClaudeSpacing.lg)
        .background(ClaudeColor.background)
    }
}
```

To see everything at once:

```swift
import ClaudeDesignSystem

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup { ClaudeShowcaseView() }
    }
}
```

---

## Token reference

### Colors — `ClaudeColor` (semantic)

| Token | Light | Dark | Use |
|---|---|---|---|
| `background` | `#FAF9F5` Book Cloth | `#181715` | Page background |
| `foreground` | `#141413` Ink | `#FAF9F5` | Default text |
| `card` | `#FFFFFF` | `#1F1E1B` | Elevated surface |
| `popover` | `#FFFFFF` | `#252320` | Floating surface |
| `primary` | `#D97757` Clay | `#D97757` | Primary CTA |
| `primaryForeground` | `#FAF9F5` | `#FAF9F5` | Text on `primary` |
| `secondary` | `#F0EEE6` | `#252320` | Subtle fill |
| `muted` | `#F0EEE6` | `#1F1E1B` | De-emphasized fill |
| `mutedForeground` | `#5E5D59` | `#A09D96` | Captions, helpers |
| `accent` | `#E8E6DC` | `#252320` | Hover states |
| `destructive` | `#C4554D` Crail | same | Errors, delete |
| `success` | `#788C5D` Olive | same | Success status |
| `warning` | `#D4A27F` Kraft | same | Caution status |
| `info` | `#6A9BCC` Sky | same | Info status |
| `border` | `#E8E6DC` | `#252320` | Hairlines |
| `input` | `#D1CFC5` | `#3D3D3A` | Form input border |
| `ring` | `#D97757` Clay | same | Focus ring |

Primitive palette also available as `ClaudeColorPrimitive.{clay, ink, bookCloth, olive, sky, fig, kraft, manilla, cactus, crail, neutral50…neutral950}`.

### Typography — `ClaudeTypography`

Every token maps to a `Font.TextStyle`, so all text **scales with Dynamic Type out of the box**.

| Token | Text Style · Weight · Design |
|---|---|
| `display` | `.largeTitle` · regular · serif |
| `title1` | `.title` · regular · serif |
| `title2` | `.title2` · semibold · default |
| `title3` | `.title3` · semibold · default |
| `title4` | `.headline` · default |
| `body` | `.body` · default |
| `bodyStrong` | `.body` · semibold · default |
| `bodySmall` | `.callout` · default |
| `label` | `.subheadline` · medium · default |
| `caption` | `.caption` · default |
| `code` | `.body` · monospaced |
| `codeSmall` | `.footnote` · monospaced |

Serif tokens render as **New York** on Apple platforms — the closest system substitute for Copernicus / Tiempos. For brand display sizes larger than `.largeTitle`, layer a custom `@ScaledMetric` in your app rather than hardcoding a fixed point size at the token level (fixed sizes break accessibility).

### Spacing — `ClaudeSpacing` (4pt grid)

`xxs: 4 · xs: 8 · sm: 12 · md: 16 · lg: 24 · xl: 32 · xxl: 48 · xxxl: 96`

### Radius — `ClaudeRadius`

`xs: 4 · sm: 6 · md: 8 · lg: 12 · xl: 16 · xxl: 24 · full: 9999`

### Motion — `ClaudeMotion`

`fast (150ms) · medium (250ms) · slow (400ms) · spring`

---

## Components

| Component | Description |
|---|---|
| `ClaudeButton` (via `.buttonStyle(.claude(...))`) | 5 variants × 3 sizes |
| `ClaudeCard` + `ClaudeCardHeader` | Bordered surface container |
| `ClaudeChatBubble` | User / assistant message bubble |
| `ClaudeTypingIndicator` | Three-dot streaming indicator |
| `ClaudeAvatar` | Initials, SF Symbol, or image |
| `ClaudeBadge` | Pill label with 7 variants |
| `ClaudeTextField` | Labeled input + helper / error |
| `ClaudeCodeBlock` | Code surface with language + copy |
| `ClaudeToast` | Status banner (info / success / warning / error) |
| `ClaudeDivider` | Horizontal / vertical hairline |

---

## Theming

Override globally with `ClaudeTheme`:

```swift
ContentView()
    .claudeTheme(
        ClaudeTheme(
            accentColor: ClaudeColorPrimitive.olive,
            cornerRadius: ClaudeRadius.lg
        )
    )
```

Theme is exposed through the `\.claudeTheme` environment value, so any component can read it.

---

## Philosophy

This system tries to make three things easy and one thing hard:

**Easy**
1. **Token consistency** — never write a literal `16` for padding; use `ClaudeSpacing.md`.
2. **Mode switching** — light / dark "just works" because every semantic color is light/dark-paired at the token layer.
3. **Code generation** — names follow shadcn's predictable conventions so an AI assistant can guess them correctly.

**Hard**
- **Drifting from the design language.** All hex values are concentrated in two files (`ClaudeColorPrimitive.swift` and `ClaudeColor.swift`). Components never reach for raw hex.

### Why three tiers?

- **Primitive** (`ClaudeColorPrimitive.clay`): raw value. Stable. Almost never referenced outside the token layer.
- **Semantic** (`ClaudeColor.primary`): intent. Adapts to light/dark. *This is what components use.*
- **Component** (`ClaudeButtonStyle`'s internal `background`): local override. Built from semantic tokens.

This is the same shape used by Atlassian, IBM Carbon, Shopify Polaris, and OUDS — and matches what shadcn/ui taught the web ecosystem.

### Why not Asset Catalog Color Sets?

We considered it. SPM resources work but require `Bundle.module` indirection per Color, hurt previewability in non-package targets, and make programmatic theming awkward. Resolving via `UIColor`/`NSColor` dynamic providers gives the same auto light/dark adaptation with simpler ergonomics.

---

## Roadmap

- `ClaudeSheet` / `ClaudeSlideOver` (Artifacts-style side panel)
- `ClaudeSelect` / `ClaudeMenu`
- `ClaudeTabs`, `ClaudeAccordion`
- Markdown rendering for chat messages
- Liquid Glass tokens (iOS 26+)
- DocC catalog with curated articles

---

## Contributing

PRs welcome. Please:
- Keep new components built from tokens, never raw hex/dimensions.
- Include a `#Preview` block for each new component.
- Add a unit test in `ClaudeDesignSystemTests`.

---

## License

[MIT](./LICENSE). Inspired by Anthropic's published visual language; not endorsed by or affiliated with Anthropic, PBC.
