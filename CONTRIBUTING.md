# Contributing to ClaudeDesignSystem

Thanks for considering a contribution! This is a young project and the door is wide open.

## Quick rules

1. **Tokens before code.** Every numeric value (color, padding, radius, duration) must come from a token. If you need a value the tokens don't cover, propose a new token first.
2. **Components are built from semantic tokens, not primitive ones.** `ClaudeColor.primary`, not `ClaudeColorPrimitive.clay`. Primitive tokens are reserved for the token layer and brand illustrations.
3. **Every component ships a `#Preview`.** Multiple previews if the component has states (loading, error, disabled).
4. **Every component ships a unit test.** A smoke test is fine — we mostly want to catch API regressions and verify the type compiles for all supported platforms.
5. **No raw hex outside `ClaudeColorPrimitive.swift` and `ClaudeColor.swift`.** This is enforced by code review.
6. **Naming follows shadcn's `background/foreground` convention.** New semantic colors should pair a surface with its on-surface text.

## Adding a new component

1. Create `Sources/ClaudeDesignSystem/Components/Claude<Name>.swift`.
2. Public types prefixed with `Claude`. `public init(...)` for all initializers.
3. Use `ButtonStyle` / `ViewModifier` / `Shape` when those Apple primitives apply — only build a custom `View` when the component owns layout.
4. Add a `#Preview("<Name>")` at the bottom of the file.
5. Add the component to `ClaudeShowcaseView` so it appears in the gallery.
6. Add a `func test_<name>_compiles()` smoke test.

## Adding a new token

1. Place it in the relevant file under `Sources/ClaudeDesignSystem/Tokens/`.
2. Add it to the README's token tables.
3. Reference it from at least one component (or document why it's primitive-only).

## Platform expectations

- iOS 16+ / macOS 13+ are the primary targets — every component must compile and render here.
- watchOS / tvOS / visionOS support is best-effort. Wrap platform-specific APIs (`UIPasteboard`, `NSPasteboard`) in `#if canImport(...)`.

## Reporting issues

Please include:
- Platform + OS version
- Xcode version
- A minimal `#Preview` that reproduces the issue
- Screenshot if it's visual

## Code style

- Swift 5.9+
- 4-space indentation
- No comments that restate what the code says
- Doc comments (`///`) for public API
