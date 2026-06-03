import SwiftUI

/// Circular avatar — shows initials, an SF Symbol, or a custom image.
public struct ClaudeAvatar: View {

    public enum Content {
        case initials(String)
        case symbol(String)
        case image(Image)
    }

    var content: Content
    var size: CGFloat
    var backgroundColor: Color

    public init(
        initials: String,
        size: CGFloat = 40,
        backgroundColor: Color = ClaudeColor.primary
    ) {
        self.content = .initials(String(initials.prefix(2)).uppercased())
        self.size = size
        self.backgroundColor = backgroundColor
    }

    public init(
        systemImage: String,
        size: CGFloat = 40,
        backgroundColor: Color = ClaudeColor.primary
    ) {
        self.content = .symbol(systemImage)
        self.size = size
        self.backgroundColor = backgroundColor
    }

    public init(
        image: Image,
        size: CGFloat = 40
    ) {
        self.content = .image(image)
        self.size = size
        self.backgroundColor = ClaudeColor.muted
    }

    public var body: some View {
        Group {
            switch content {
            case .initials(let text):
                Text(text)
                    .font(.system(size: size * 0.4, weight: .medium))
                    .foregroundStyle(ClaudeColor.primaryForeground)
            case .symbol(let name):
                Image(systemName: name)
                    .font(.system(size: size * 0.45, weight: .medium))
                    .foregroundStyle(ClaudeColor.primaryForeground)
            case .image(let image):
                image
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: size, height: size)
        .background(backgroundColor)
        .clipShape(Circle())
        .accessibilityElement()
        .accessibilityLabel(accessibilityLabel)
    }

    private var accessibilityLabel: String {
        switch content {
        case .initials(let text): return "Avatar, \(text)"
        case .symbol: return "Avatar"
        case .image: return "Avatar"
        }
    }
}

