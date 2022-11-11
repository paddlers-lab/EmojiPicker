# EmojiPicker

Simple Single Select EmojiPicker

Pure SwiftUI & iOS16+ Support 

![EmojiPicker](https://user-images.githubusercontent.com/19603983/201371709-bcc5017a-c1f1-439a-8ccd-2ccd97b7c2d2.gif)

## Usage

```swift
struct EmojiPickerExample: View {
  
  @State private var emoji: String?
  
  private var allSelections = Emojis(categories: [
    EmojiCategory(
      icon: "👕",
      emojis: [
      "🧥", "🥼", "🦺"
    ]),
    EmojiCategory(
      icon: "🐶",
      emojis: [
        "🐶", "🐱", "🐹"
    ]),
  ])
  
  var body: some View {
    EmojiPicker(
      emojis: allSelections, // You can set any emoji you like here.
      selection: $emoji  // Value changed when the user select a emoji.
    )
  }
}
```

Then you can also refer to Example playgrounds App! -> Example.swiftpm

## Lisence

MIT LIsence
