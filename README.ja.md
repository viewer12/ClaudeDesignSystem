<p align="right">
  <a href="./README.md">English</a> ·
  <a href="./README.zh-CN.md">简体中文</a> ·
  <b>日本語</b>
</p>

# ClaudeDesignSystem for SwiftUI

Anthropic Claude プロダクトのビジュアル言語にインスパイアされた、SwiftUI ネイティブのデザインシステムです。Book Cloth の暖色サーフェス、Clay オレンジのアクセント、暖かみのあるニュートラルパレット、控えめなモーション、そしてセリフ系のディスプレイ書体とサンセリフ系の本文書体の組み合わせを再現します。

> **Anthropic 公式プロジェクトではありません。** これは Claude の公開ビジュアル言語に**インスパイアされた**コミュニティ製のオープンソースデザインシステムです。Anthropic, PBC との提携、推奨、スポンサー関係はありません。「Claude」の名称および関連商標は Anthropic, PBC に帰属します。詳細は [LICENSE](./LICENSE) をご覧ください。

---

## ハイライト

- **Pure SwiftUI** — UIKit ブリッジも外部依存もありません
- **3 層トークンシステム** — Primitive → Semantic → Component（OUDS / Atlassian / shadcn の慣習）
- **`background / foreground` のペア命名** — shadcn が広めた命名規約を、SwiftUI ネイティブにマッピング
- **ライト・ダーク両モード** — すべてのセマンティックカラーがトークン層でペアリングされ、`UITraitCollection` / `NSAppearance` によって自動切替
- **マルチプラットフォーム** — iOS 16+、macOS 13+、watchOS 9+、tvOS 16+、visionOS 1+
- **Apple ネイティブを基盤に** — `ButtonStyle`、`Material`、SF Symbols、Dynamic Type の上に構築
- **すぐ使えるショーケース** — `ClaudeShowcaseView` で全コンポーネントを 1 画面で確認

---

## インストール

### Swift Package Manager（推奨）

Xcode で **File → Add Package Dependencies…** を開き、以下を貼り付けてください：

```
https://github.com/viewer12/ClaudeDesignSystem
```

または `Package.swift` に直接記述します：

```swift
dependencies: [
    .package(url: "https://github.com/viewer12/ClaudeDesignSystem", from: "0.1.0")
],
targets: [
    .target(name: "MyApp", dependencies: ["ClaudeDesignSystem"])
]
```

---

## クイックスタート

```swift
import SwiftUI
import ClaudeDesignSystem

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        VStack(alignment: .leading, spacing: ClaudeSpacing.md) {
            Text("Claude へようこそ")
                .font(ClaudeTypography.title1)
                .foregroundStyle(ClaudeColor.foreground)

            ClaudeTextField(
                "お名前",
                text: $name,
                label: "名前",
                systemImage: "person"
            )

            Button("続ける") { /* … */ }
                .buttonStyle(.claude(variant: .primary, size: .large, fullWidth: true))
        }
        .padding(ClaudeSpacing.lg)
        .background(ClaudeColor.background)
    }
}
```

すべてを一度に見るには：

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

## トークンリファレンス

### カラー — `ClaudeColor`（セマンティック層）

| Token | ライト | ダーク | 用途 |
|---|---|---|---|
| `background` | `#FAF9F5` Book Cloth | `#181715` | ページ背景 |
| `foreground` | `#141413` Ink | `#FAF9F5` | 既定のテキスト色 |
| `card` | `#FFFFFF` | `#1F1E1B` | カード／立ち上げサーフェス |
| `popover` | `#FFFFFF` | `#252320` | フローティングサーフェス |
| `primary` | `#D97757` Clay | `#D97757` | プライマリ CTA |
| `primaryForeground` | `#FAF9F5` | `#FAF9F5` | `primary` 上のテキスト |
| `secondary` | `#F0EEE6` | `#252320` | サブ塗り |
| `muted` | `#F0EEE6` | `#1F1E1B` | 強調を抑えた領域 |
| `mutedForeground` | `#5E5D59` | `#A09D96` | キャプション、補助テキスト |
| `accent` | `#E8E6DC` | `#252320` | ホバー状態 |
| `destructive` | `#C4554D` Crail | 同 | エラー／削除 |
| `success` | `#788C5D` Olive | 同 | 成功ステータス |
| `warning` | `#D4A27F` Kraft | 同 | 注意ステータス |
| `info` | `#6A9BCC` Sky | 同 | 情報ステータス |
| `border` | `#E8E6DC` | `#252320` | ヘアライン |
| `input` | `#D1CFC5` | `#3D3D3A` | 入力欄のボーダー |
| `ring` | `#D97757` Clay | 同 | フォーカスリング |

プリミティブパレットも `ClaudeColorPrimitive.{clay, ink, bookCloth, olive, sky, fig, kraft, manilla, cactus, crail, neutral50…neutral950}` として公開されています。

### タイポグラフィ — `ClaudeTypography`

各トークンは `Font.TextStyle` にマッピングされており、**Dynamic Type に自動対応します**。

| Token | テキストスタイル · ウェイト · デザイン |
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

セリフ系トークンは Apple プラットフォーム上で **New York** としてレンダリングされます。これは Copernicus / Tiempos に最も近いシステム代替です。`.largeTitle` を超えるブランドディスプレイサイズが必要な場合は、トークン層で固定ポイントを書くのではなく、アプリ側で `@ScaledMetric` を重ねてください（固定サイズはアクセシビリティを損ないます）。

### スペーシング — `ClaudeSpacing`（4pt グリッド）

`xxs: 4 · xs: 8 · sm: 12 · md: 16 · lg: 24 · xl: 32 · xxl: 48 · xxxl: 96`

### コーナー半径 — `ClaudeRadius`

`xs: 4 · sm: 6 · md: 8 · lg: 12 · xl: 16 · xxl: 24 · full: 9999`

### モーション — `ClaudeMotion`

`fast (150ms) · medium (250ms) · slow (400ms) · spring`

---

## コンポーネント

| コンポーネント | 説明 |
|---|---|
| `ClaudeButton`（`.buttonStyle(.claude(...))` 経由） | 5 バリアント × 3 サイズ |
| `ClaudeCard` + `ClaudeCardHeader` | ボーダー付きサーフェスコンテナ |
| `ClaudeChatBubble` | ユーザー／アシスタントのチャットバブル |
| `ClaudeTypingIndicator` | 3 点ストリーミングインジケーター |
| `ClaudeAvatar` | イニシャル／SF Symbol／画像の 3 形態 |
| `ClaudeBadge` | 7 バリアントのピル型ラベル |
| `ClaudeTextField` | ラベル／ヘルパー／エラー対応の入力欄 |
| `ClaudeCodeBlock` | 言語ラベルとコピーボタン付きコードブロック |
| `ClaudeToast` | ステータスバナー（info / success / warning / error） |
| `ClaudeDivider` | 水平／垂直のヘアライン |

---

## テーマ

`ClaudeTheme` でグローバルに上書きできます：

```swift
ContentView()
    .claudeTheme(
        ClaudeTheme(
            accentColor: ClaudeColorPrimitive.olive,
            cornerRadius: ClaudeRadius.lg
        )
    )
```

テーマは `\.claudeTheme` 環境値として公開され、どのコンポーネントからも参照できます。

---

## 設計思想

このシステムは 3 つを「簡単に」、1 つを「あえて難しく」しています。

**簡単にしていること**
1. **トークンの一貫性** — リテラルの `16` を書かず、`ClaudeSpacing.md` を使います
2. **モード切替** — セマンティックカラーがトークン層でペアリングされているため、ライト／ダークが「自動で正しくなる」
3. **コード生成** — shadcn の予測可能な命名規約に従っているため、AI アシスタントが正しく推測できます

**あえて難しくしていること**
- **デザイン言語からの逸脱。** すべての hex 値は `ClaudeColorPrimitive.swift` と `ClaudeColor.swift` の 2 ファイルに集約されています。コンポーネントが生の hex を参照することは絶対にありません。

### なぜ 3 層なのか

- **Primitive**（`ClaudeColorPrimitive.clay`）：生の値。安定的で、トークン層の外からはほぼ参照されない
- **Semantic**（`ClaudeColor.primary`）：意図を表す。ライト／ダークに自動適応。*コンポーネントが使うべきはこの層*
- **Component**（`ClaudeButtonStyle` 内部の `background`）：ローカルな上書き。セマンティック層から組み立てる

これは Atlassian、IBM Carbon、Shopify Polaris、OUDS でも採用されている形式であり、shadcn/ui が Web エコシステムに広めたパターンと同じです。

### なぜ Asset Catalog の Color Set を使わないのか

検討はしました。SPM リソースとして使えますが、Color ごとに `Bundle.module` の間接参照が必要になり、非パッケージターゲットでのプレビューが扱いづらく、プログラム的なテーマ切替も不格好になります。`UIColor` / `NSColor` の dynamic provider を使えば、同じ自動ライト／ダーク適応をよりシンプルなエルゴノミクスで実現できます。

---

## ロードマップ

- `ClaudeSheet` / `ClaudeSlideOver`（Artifacts 風のサイドパネル）
- `ClaudeSelect` / `ClaudeMenu`
- `ClaudeTabs`、`ClaudeAccordion`
- チャットメッセージの Markdown レンダリング
- Liquid Glass トークン（iOS 26+）
- 厳選記事付きの DocC カタログ

---

## コントリビュート

PR を歓迎します。以下にご協力ください：
- 新しいコンポーネントは必ずトークンから組み立て、生の hex / 寸法を書かないこと
- 新しいコンポーネントごとに `#Preview` ブロックを含めること
- `ClaudeDesignSystemTests` にユニットテストを追加すること

---

## ライセンス

[MIT](./LICENSE)。Anthropic の公開ビジュアル言語にインスパイアされたものであり、Anthropic, PBC からの推奨や提携関係はありません。
