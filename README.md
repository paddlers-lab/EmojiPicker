# EmojiPicker

Simple Single Select EmojiPicker

Pure SwiftUI & iOS15.0+ Support 

![EmojiPicker](https://user-images.githubusercontent.com/19603983/201375255-3dfd24ad-d5a0-44ac-985f-6bdbafd8fdea.gif)


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
