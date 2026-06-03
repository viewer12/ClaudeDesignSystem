<p align="right">
  <a href="./README.md">English</a> ·
  <b>简体中文</b> ·
  <a href="./README.ja.md">日本語</a>
</p>

# ClaudeDesignSystem for SwiftUI

一套社区驱动、纯 SwiftUI 实现的设计系统，灵感取自 Anthropic Claude 产品的视觉语言 —— Book Cloth 暖底色、Clay 橙强调色、暖灰中性色板、克制的动效，以及衬线展示字 + 无衬线正文字的字体搭配。

> **非 Anthropic 官方项目。** 这是一个**受** Claude 公开视觉语言**启发**的开源设计系统，与 Anthropic 公司无任何隶属、背书或赞助关系。"Claude" 名称及相关商标归 Anthropic, PBC 所有。详见 [LICENSE](./LICENSE)。

---

## 亮点

- **纯 SwiftUI** —— 不依赖 UIKit 桥接，也无任何第三方依赖
- **三层 Token 体系** —— 基础层 (Primitive) → 语义层 (Semantic) → 组件层 (Component)，沿用 OUDS / Atlassian / shadcn 的惯例
- **`background / foreground` 配对命名** —— shadcn 推广的成对命名法，原生映射到 SwiftUI
- **亮色与暗色** —— 每个语义色都在 token 层完成 light/dark 配对，自动通过 `UITraitCollection` / `NSAppearance` 切换
- **多端支持** —— iOS 16+、macOS 13+、watchOS 9+、tvOS 16+、visionOS 1+
- **Apple 原生根基** —— 基于 `ButtonStyle`、`Material`、SF Symbols、Dynamic Type
- **开箱即用的展示页** —— `ClaudeShowcaseView` 一屏列出所有组件

---

## 安装

### Swift Package Manager（推荐）

在 Xcode 中：**File → Add Package Dependencies…**，粘贴：

```
https://github.com/viewer12/ClaudeDesignSystem
```

或者写进 `Package.swift`：

```swift
dependencies: [
    .package(url: "https://github.com/viewer12/ClaudeDesignSystem", from: "0.1.0")
],
targets: [
    .target(name: "MyApp", dependencies: ["ClaudeDesignSystem"])
]
```

---

## 快速上手

```swift
import SwiftUI
import ClaudeDesignSystem

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.md) {
            Text("欢迎使用 Claude")
                .font(ClaudeTypography.title1)
                .foregroundStyle(ClaudeColor.foreground)

            ClaudeTextField(
                "你的名字",
                text: $name,
                label: "名字",
                systemImage: "person"
            )

            Button("继续") { /* … */ }
                .buttonStyle(.claude(variant: .primary, size: .large, fullWidth: true))
        }
        .padding(ClaudeSpacing.lg)
        .background(ClaudeColor.background)
    }
}
```

一屏看遍所有组件：

```swift
import ClaudeDesignSystem

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup { ClaudeShowcaseView() }
    }
}
```

---

## Token 速查

### 颜色 —— `ClaudeColor`（语义层）

| Token | 亮色 | 暗色 | 用途 |
|---|---|---|---|
| `background` | `#FAF9F5` Book Cloth | `#181715` | 页面底色 |
| `foreground` | `#141413` Ink | `#FAF9F5` | 默认正文色 |
| `card` | `#FFFFFF` | `#1F1E1B` | 卡片 / 抬升表面 |
| `popover` | `#FFFFFF` | `#252320` | 浮层 |
| `primary` | `#D97757` Clay | `#D97757` | 主操作按钮 |
| `primaryForeground` | `#FAF9F5` | `#FAF9F5` | `primary` 上的文字 |
| `secondary` | `#F0EEE6` | `#252320` | 次要填充 |
| `muted` | `#F0EEE6` | `#1F1E1B` | 弱化区域 |
| `mutedForeground` | `#5E5D59` | `#A09D96` | 注释、辅助文字 |
| `accent` | `#E8E6DC` | `#252320` | 悬停态 |
| `destructive` | `#C4554D` Crail | 同 | 错误 / 删除 |
| `success` | `#788C5D` Olive | 同 | 成功状态 |
| `warning` | `#D4A27F` Kraft | 同 | 警告状态 |
| `info` | `#6A9BCC` Sky | 同 | 信息提示 |
| `border` | `#E8E6DC` | `#252320` | 边线 / 分隔 |
| `input` | `#D1CFC5` | `#3D3D3A` | 输入框边框 |
| `ring` | `#D97757` Clay | 同 | 焦点环 |

基础色板还提供 `ClaudeColorPrimitive.{clay, ink, bookCloth, olive, sky, fig, kraft, manilla, cactus, crail, neutral50…neutral950}`。

### 字号 —— `ClaudeTypography`

所有 token 映射到 `Font.TextStyle`，**自动响应 Dynamic Type**。

| Token | 文本样式 · 字重 · 字形 |
|---|---|
| `display` | `.largeTitle` · regular · serif |
| `title1` | `.title` · regular · serif |
| `title2` | `.title2` · semibold |
| `title3` | `.title3` · semibold |
| `title4` | `.headline` |
| `body` | `.body` |
| `bodyStrong` | `.body` · semibold |
| `bodySmall` | `.callout` |
| `label` | `.subheadline` · medium |
| `caption` | `.caption` |
| `code` | `.body` · monospaced |
| `codeSmall` | `.footnote` · monospaced |

衬线 token 在 Apple 平台上渲染为 **New York**，是 Copernicus / Tiempos 最接近的系统替代。如果需要比 `.largeTitle` 更大的品牌展示字，建议在 App 层用 `@ScaledMetric` 实现，而不是在 token 层写死点数（写死点数会破坏 Dynamic Type）。

### 间距 —— `ClaudeSpacing`（4pt 栅格）

`xxs: 4 · xs: 8 · sm: 12 · md: 16 · lg: 24 · xl: 32 · xxl: 48 · xxxl: 96`

### 圆角 —— `ClaudeRadius`

`xs: 4 · sm: 6 · md: 8 · lg: 12 · xl: 16 · xxl: 24 · full: 9999`

### 动效 —— `ClaudeMotion`

`fast (150ms) · medium (250ms) · slow (400ms) · spring`

---

## 组件清单

| 组件 | 说明 |
|---|---|
| `ClaudeButton`（用 `.buttonStyle(.claude(...))`） | 5 种 variant × 3 种尺寸 |
| `ClaudeCard` + `ClaudeCardHeader` | 带边框的容器表面 |
| `ClaudeChatBubble` | 用户 / Claude 的对话气泡 |
| `ClaudeTypingIndicator` | 三点流式输入指示器 |
| `ClaudeAvatar` | 首字母 / SF Symbol / 图片三种形态 |
| `ClaudeBadge` | 7 种 variant 的胶囊标签 |
| `ClaudeTextField` | 带 label / 帮助 / 错误态的输入框 |
| `ClaudeCodeBlock` | 带语言标签与复制按钮的代码块 |
| `ClaudeToast` | 状态横幅（info / success / warning / error） |
| `ClaudeDivider` | 水平或垂直的细线分隔 |

---

## 主题定制

通过 `ClaudeTheme` 全局覆盖：

```swift
ContentView()
    .claudeTheme(
        ClaudeTheme(
            accentColor: ClaudeColorPrimitive.olive,
            cornerRadius: ClaudeRadius.lg
        )
    )
```

主题通过 `\.claudeTheme` 环境值暴露，任何组件都可读取。

---

## 设计哲学

这个系统刻意让三件事变得容易，让一件事变得困难。

**容易做到**
1. **Token 一致性** —— 永远不写字面量 `16`，而用 `ClaudeSpacing.md`
2. **模式切换** —— 亮色/暗色"自动就对了"，因为每个语义色都在 token 层完成了配对
3. **AI 代码生成** —— 命名遵循 shadcn 的可预测惯例，AI 助手能准确"猜"出 token 名

**故意困难**
- **偏离设计语言。** 所有 hex 值都集中在两个文件（`ClaudeColorPrimitive.swift` 和 `ClaudeColor.swift`），组件代码绝不直接碰 hex

### 为什么是三层？

- **基础层**（`ClaudeColorPrimitive.clay`）：原始数值。稳定，几乎不会在 token 层之外被引用
- **语义层**（`ClaudeColor.primary`）：意图。自动适配 light/dark。*这是组件该用的层*
- **组件层**（`ClaudeButtonStyle` 内部的 `background`）：局部覆盖。由语义层组装而来

这正是 Atlassian、IBM Carbon、Shopify Polaris、OUDS 都采用的形态，也是 shadcn/ui 教会 Web 生态的范式。

### 为什么不用 Asset Catalog 的 Color Set？

考虑过。SPM 资源可以用，但每个 Color 都需要 `Bundle.module` 间接，在非包目标里影响预览体验，编程式主题切换也变得别扭。用 `UIColor` / `NSColor` 的 dynamic provider 既能自动响应模式，又更顺手。

---

## 路线图

- `ClaudeSheet` / `ClaudeSlideOver`（Artifacts 风格的侧栏）
- `ClaudeSelect` / `ClaudeMenu`
- `ClaudeTabs`、`ClaudeAccordion`
- 聊天消息的 Markdown 渲染
- Liquid Glass token（iOS 26+）
- 带专题文章的 DocC 文档

---

## 参与贡献

欢迎 PR。请遵循：
- 新组件必须从 token 组装，不要写死 hex 或具体尺寸
- 每个新组件附带 `#Preview` 代码块
- 在 `ClaudeDesignSystemTests` 中加一条单元测试

---

## 许可证

[MIT](./LICENSE)。受 Anthropic 公开视觉语言启发，与 Anthropic 公司无任何隶属或背书关系。
