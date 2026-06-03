import SwiftUI

/// Corner radius scale.
///
/// Claude's visual language uses noticeably softer radii than Material/Carbon —
/// favoring 8pt buttons and 12pt cards over the sharper 4pt typical of dense UI.
public enum ClaudeRadius {
    /// 4pt — tight elements
    public static let xs: CGFloat = 4
    /// 6pt — badges, chips
    public static let sm: CGFloat = 6
    /// 8pt — buttons, inputs (default)
    public static let md: CGFloat = 8
    /// 12pt — cards (default)
    public static let lg: CGFloat = 12
    /// 16pt — chat bubbles, hero surfaces
    public static let xl: CGFloat = 16
    /// 24pt — large containers
    public static let xxl: CGFloat = 24
    /// Fully rounded — pills, avatars
    public static let full: CGFloat = 9999
}
