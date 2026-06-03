import SwiftUI

/// 4pt base spacing scale, matching Claude's `4 / 8 / 12 / 16 / 24 / 32 / 48 / 96` rhythm.
public enum ClaudeSpacing {
    /// 4pt
    public static let xxs: CGFloat = 4
    /// 8pt
    public static let xs: CGFloat = 8
    /// 12pt
    public static let sm: CGFloat = 12
    /// 16pt — default body padding
    public static let md: CGFloat = 16
    /// 24pt — section padding
    public static let lg: CGFloat = 24
    /// 32pt
    public static let xl: CGFloat = 32
    /// 48pt
    public static let xxl: CGFloat = 48
    /// 96pt — hero whitespace
    public static let xxxl: CGFloat = 96
}
