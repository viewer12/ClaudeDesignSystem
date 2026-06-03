import SwiftUI

/// Tier 2 — Semantic color tokens.
///
/// Follows the `background/foreground` pairing convention popularized by
/// shadcn/ui. Each token adapts automatically to light and dark mode.
///
/// Use these in component code; reach for `ClaudeColorPrimitive` only when
/// you need an exact brand hue (e.g. illustrations, brand surfaces).
public enum ClaudeColor {

    // MARK: - Surfaces

    /// Page background.
    public static let background = Color(
        light: ClaudeColorPrimitive.bookCloth,
        dark: ClaudeColorPrimitive.neutral950
    )

    /// Default text color on `background`.
    public static let foreground = Color(
        light: ClaudeColorPrimitive.ink,
        dark: ClaudeColorPrimitive.neutral50
    )

    /// Card / elevated surface background.
    public static let card = Color(
        light: .white,
        dark: ClaudeColorPrimitive.neutral900
    )

    /// Default text color on `card`.
    public static let cardForeground = Color(
        light: ClaudeColorPrimitive.ink,
        dark: ClaudeColorPrimitive.neutral50
    )

    /// Popover / floating surface background.
    public static let popover = Color(
        light: .white,
        dark: ClaudeColorPrimitive.neutral800
    )

    public static let popoverForeground = Color(
        light: ClaudeColorPrimitive.ink,
        dark: ClaudeColorPrimitive.neutral50
    )

    // MARK: - Intent

    /// Primary action (Clay orange). Consistent across both modes.
    public static let primary = ClaudeColorPrimitive.clay
    public static let primaryForeground = ClaudeColorPrimitive.bookCloth

    /// Secondary action — subtle background, primary text.
    public static let secondary = Color(
        light: ClaudeColorPrimitive.neutral100,
        dark: ClaudeColorPrimitive.neutral800
    )

    public static let secondaryForeground = Color(
        light: ClaudeColorPrimitive.ink,
        dark: ClaudeColorPrimitive.neutral50
    )

    /// Muted background — for de-emphasized regions, code blocks, etc.
    public static let muted = Color(
        light: ClaudeColorPrimitive.neutral100,
        dark: ClaudeColorPrimitive.neutral900
    )

    /// De-emphasized text — captions, helper text.
    public static let mutedForeground = Color(
        light: ClaudeColorPrimitive.neutral600,
        dark: Color(hex: 0xA09D96)
    )

    /// Accent background — hover states, soft highlights.
    public static let accent = Color(
        light: ClaudeColorPrimitive.neutral200,
        dark: ClaudeColorPrimitive.neutral800
    )

    public static let accentForeground = Color(
        light: ClaudeColorPrimitive.ink,
        dark: ClaudeColorPrimitive.neutral50
    )

    /// Destructive action / error.
    public static let destructive = ClaudeColorPrimitive.crail
    public static let destructiveForeground = ClaudeColorPrimitive.bookCloth

    // MARK: - Status

    public static let success = ClaudeColorPrimitive.olive
    public static let successForeground = ClaudeColorPrimitive.bookCloth

    public static let warning = ClaudeColorPrimitive.kraft
    public static let warningForeground = ClaudeColorPrimitive.ink

    public static let info = ClaudeColorPrimitive.sky
    public static let infoForeground = ClaudeColorPrimitive.bookCloth

    // MARK: - Form / lines

    /// Border for cards, dividers, hairlines.
    public static let border = Color(
        light: ClaudeColorPrimitive.neutral200,
        dark: ClaudeColorPrimitive.neutral800
    )

    /// Border for form inputs.
    public static let input = Color(
        light: ClaudeColorPrimitive.neutral300,
        dark: ClaudeColorPrimitive.neutral700
    )

    /// Focus ring color.
    public static let ring = ClaudeColorPrimitive.clay
}
