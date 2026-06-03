// Example consumer app.
//
// To run: create a new Xcode "iOS App" or "macOS App" project, add this package
// as a local dependency, and replace the entry-point file with this content.

#if canImport(SwiftUI)
import SwiftUI
import ClaudeDesignSystem

@main
struct ClaudeDesignSystemDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ClaudeShowcaseView()
                .claudeTheme(.default)
        }
        #if os(macOS)
        .defaultSize(width: 760, height: 1000)
        #endif
    }
}
#endif
