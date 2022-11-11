import SwiftUI

public struct Emojis {
  public var categories: [EmojiCategory]
  
  public init(categories: [EmojiCategory]) {
    self.categories = categories
  }
}

public struct EmojiCategory {
  public var icon: String
  public var emojis: [String]
  
  public init(icon: String, emojis: [String]) {
    self.icon = icon
    self.emojis = emojis
  }
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
