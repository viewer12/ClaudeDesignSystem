import SwiftUI

/// Type scale built on Apple's text style system.
///
/// Every token maps to a `Font.TextStyle` (`.body`, `.title2`, ...) so it
/// scales automatically with Dynamic Type. Serif sizes use `.serif` design,
/// which renders as **New York** on Apple platforms — the closest system
/// substitute for Claude's Copernicus / Tiempos.
///
/// For brand display sizes that need to be larger than `.largeTitle`, layer
/// a custom `@ScaledMetric` in your app code rather than hardcoding a size
/// here — fixed sizes break accessibility.
public enum ClaudeTypography {

    // MARK: - Display (serif)

    /// `.largeTitle` serif regular — hero display.
    public static let display = Font.system(.largeTitle, design: .serif).weight(.regular)

    /// `.title` serif regular — page title.
    public static let title1 = Font.system(.title, design: .serif).weight(.regular)

    // MARK: - Headings (sans)

    /// `.title2` semibold — section title.
    public static let title2 = Font.system(.title2).weight(.semibold)

    /// `.title3` semibold — subsection title.
    public static let title3 = Font.system(.title3).weight(.semibold)

    /// `.headline` — card title, small heading. Already semibold by default.
    public static let title4 = Font.system(.headline)

    // MARK: - Body

    /// `.body` — default body / chat message.
    public static let body = Font.system(.body)

    /// `.body` semibold — emphasized body.
    public static let bodyStrong = Font.system(.body).weight(.semibold)

    /// `.callout` — secondary body, button label.
    public static let bodySmall = Font.system(.callout)

    /// `.subheadline` medium — form labels.
    public static let label = Font.system(.subheadline).weight(.medium)

    /// `.caption` — captions, badges, helper text.
    public static let caption = Font.system(.caption)

    // MARK: - Code

    /// `.body` monospaced — inline and block code.
    public static let code = Font.system(.body, design: .monospaced)

    /// `.footnote` monospaced — code annotations.
    public static let codeSmall = Font.system(.footnote, design: .monospaced)
}
