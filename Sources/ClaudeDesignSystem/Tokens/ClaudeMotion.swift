import SwiftUI

/// Motion tokens.
///
/// Claude's interaction language is restrained: short, eased transitions and
/// almost no decorative animation. Three durations cover virtually every case.
public enum ClaudeMotion {

    // MARK: - Durations

    /// 150ms — hover, press, focus.
    public static let fastDuration: Double = 0.15
    /// 250ms — content entrance, modal open.
    public static let mediumDuration: Double = 0.25
    /// 400ms — page transitions.
    public static let slowDuration: Double = 0.4

    // MARK: - Animations

    /// Hover, press, focus — `easeInOut` 150ms.
    public static let fast = Animation.easeInOut(duration: fastDuration)

    /// Content entrance, modal open — `easeInOut` 250ms.
    public static let medium = Animation.easeInOut(duration: mediumDuration)

    /// Page transitions — `easeInOut` 400ms.
    public static let slow = Animation.easeInOut(duration: slowDuration)

    /// Interactive spring for draggable / responsive UI.
    public static let spring = Animation.interactiveSpring(
        response: 0.3,
        dampingFraction: 0.7,
        blendDuration: 0.1
    )
}
