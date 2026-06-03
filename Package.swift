// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ClaudeDesignSystem",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .watchOS(.v9),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ClaudeDesignSystem",
            targets: ["ClaudeDesignSystem"]
        )
    ],
    targets: [
        .target(
            name: "ClaudeDesignSystem",
            path: "Sources/ClaudeDesignSystem"
        ),
        .testTarget(
            name: "ClaudeDesignSystemTests",
            dependencies: ["ClaudeDesignSystem"],
            path: "Tests/ClaudeDesignSystemTests"
        )
    ]
)
