import XCTest
import SwiftUI
@testable import ClaudeDesignSystem

final class ClaudeDesignSystemTests: XCTestCase {

    // MARK: - Tokens compile and resolve

    func test_primitiveColors_haveDistinctValues() {
        XCTAssertNotEqual(ClaudeColorPrimitive.clay, ClaudeColorPrimitive.ink)
        XCTAssertNotEqual(ClaudeColorPrimitive.bookCloth, ClaudeColorPrimitive.neutral950)
    }

    func test_semanticColors_resolve() {
        // Smoke test — values should not be the default sentinel.
        _ = ClaudeColor.background
        _ = ClaudeColor.foreground
        _ = ClaudeColor.primary
        _ = ClaudeColor.destructive
        XCTAssertEqual(ClaudeColor.primary, ClaudeColorPrimitive.clay)
    }

    func test_spacing_followsFourPointGrid() {
        XCTAssertEqual(ClaudeSpacing.xxs, 4)
        XCTAssertEqual(ClaudeSpacing.xs, 8)
        XCTAssertEqual(ClaudeSpacing.md, 16)
        XCTAssertEqual(ClaudeSpacing.lg, 24)
        XCTAssertEqual(ClaudeSpacing.xl, 32)
        // Every step must be a multiple of 4.
        for step in [
            ClaudeSpacing.xxs, ClaudeSpacing.xs, ClaudeSpacing.sm,
            ClaudeSpacing.md, ClaudeSpacing.lg, ClaudeSpacing.xl,
            ClaudeSpacing.xxl, ClaudeSpacing.xxxl
        ] {
            XCTAssertEqual(step.truncatingRemainder(dividingBy: 4), 0, "\(step) is not a multiple of 4")
        }
    }

    func test_radius_isMonotonicallyIncreasing() {
        let scale = [
            ClaudeRadius.xs, ClaudeRadius.sm, ClaudeRadius.md,
            ClaudeRadius.lg, ClaudeRadius.xl, ClaudeRadius.xxl
        ]
        XCTAssertEqual(scale, scale.sorted())
    }

    func test_motion_durations_increase() {
        XCTAssertLessThan(ClaudeMotion.fastDuration, ClaudeMotion.mediumDuration)
        XCTAssertLessThan(ClaudeMotion.mediumDuration, ClaudeMotion.slowDuration)
    }

    // MARK: - Color hex initializer

    func test_colorHex_roundTrips() {
        let clay = Color(hex: 0xD97757)
        XCTAssertEqual(clay, ClaudeColorPrimitive.clay)
    }

    // MARK: - Theme

    func test_defaultTheme_usesPrimaryAccent() {
        XCTAssertEqual(ClaudeTheme.default.accentColor, ClaudeColor.primary)
        XCTAssertEqual(ClaudeTheme.default.cornerRadius, ClaudeRadius.md)
    }

    func test_customTheme_overrides() {
        let custom = ClaudeTheme(
            accentColor: ClaudeColorPrimitive.olive,
            cornerRadius: ClaudeRadius.lg
        )
        XCTAssertEqual(custom.accentColor, ClaudeColorPrimitive.olive)
        XCTAssertEqual(custom.cornerRadius, ClaudeRadius.lg)
    }

    // MARK: - Components instantiate

    func test_components_compile() {
        _ = ClaudeButtonStyle()
        _ = ClaudeCard { Text("Hi") }
        _ = ClaudeAvatar(initials: "AB")
        _ = ClaudeAvatar(systemImage: "sparkles")
        _ = ClaudeBadge("Demo")
        _ = ClaudeDivider()
        _ = ClaudeCodeBlock("print(1)", language: "swift")
        _ = ClaudeTypingIndicator()
        _ = ClaudeToast("title", kind: .info)
    }
}
