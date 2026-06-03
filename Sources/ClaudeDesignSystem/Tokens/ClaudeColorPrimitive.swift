import SwiftUI

/// Tier 1 — Primitive color tokens.
///
/// Raw values from Claude's brand palette. **Do not** reference these directly
/// in component code; use `ClaudeColor` semantic tokens instead.
public enum ClaudeColorPrimitive {

    // MARK: - Brand

    /// Clay — Claude's signature warm orange. Primary CTA color.
    public static let clay = Color(hex: 0xD97757)
    /// Antique Brass — pressed/active state variant of Clay.
    public static let antiqueBrass = Color(hex: 0xCC785C)
    /// Book Cloth — the warm off-white that defines Claude's light surfaces.
    public static let bookCloth = Color(hex: 0xFAF9F5)
    /// Ink — near-black for text and dark surfaces.
    public static let ink = Color(hex: 0x141413)

    // MARK: - Warm accent palette

    public static let olive = Color(hex: 0x788C5D)
    public static let sky = Color(hex: 0x6A9BCC)
    public static let fig = Color(hex: 0xC46686)
    public static let cactus = Color(hex: 0xBCD1CA)
    public static let manilla = Color(hex: 0xEBDBBC)
    public static let kraft = Color(hex: 0xD4A27F)
    public static let crail = Color(hex: 0xC4554D)

    // MARK: - Warm neutral scale (light → dark)

    public static let neutral50 = Color(hex: 0xFAF9F5)
    public static let neutral100 = Color(hex: 0xF0EEE6)
    public static let neutral200 = Color(hex: 0xE8E6DC)
    public static let neutral300 = Color(hex: 0xD1CFC5)
    public static let neutral400 = Color(hex: 0xB0AEA5)
    public static let neutral500 = Color(hex: 0x87867F)
    public static let neutral600 = Color(hex: 0x5E5D59)
    public static let neutral700 = Color(hex: 0x3D3D3A)
    public static let neutral800 = Color(hex: 0x252320)
    public static let neutral900 = Color(hex: 0x1F1E1B)
    public static let neutral950 = Color(hex: 0x181715)
}
