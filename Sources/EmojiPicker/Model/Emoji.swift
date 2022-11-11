import SwiftUI

public struct Emojis {
  public var categories: [EmojiCategory]
}

public struct EmojiCategory {
  public var icon: String
  public var emojis: [String]
}

extension Emojis {
  public static var emotion = Emojis(
    categories: [
      EmojiCategory(icon: "😃", emojis: ["😀", "😃", "😄", "😁", "😆"]),
      EmojiCategory(icon: "🥲", emojis: ["🥹", "😅", "😂", "🤣", "🥲"]),
      EmojiCategory(icon: "😠", emojis: ["😠", "😡", "🤬", "🤯", "😳"]),
      EmojiCategory(icon: "🤤", emojis: ["😴", "🤤", "😪", "😮‍💨", "😵"])
    ]
  )
}
