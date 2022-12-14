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
      EmojiCategory(
        icon: "๐",
        emojis: ["๐", "๐", "๐", "๐", "๐", "๐ฅน", "๐", "๐", "๐คฃ", "๐ฅฒ", "โบ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ฅฐ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐คช", "๐คจ", "๐ง", "๐ค", "๐", "๐ฅธ", "๐คฉ", "๐ฅณ", "๐", "๐"]
      ),
      EmojiCategory(
        icon: "๐",
        emojis: ["๐", "๐", "๐", "๐", "๐", "โน", "๐ฃ", "๐", "๐ซ", "๐ฉ", "๐ฅบ", "๐ข", "๐ญ"]
      ),
      EmojiCategory(
        icon: "๐ค",
        emojis: ["๐ค", "๐ ", "๐ก", "๐คฌ", "๐คฏ", "๐ณ", "๐ฅต", "๐ฅถ", "๐ถ", "๐ฑ", "๐จ", "๐ฐ", "๐ฅ", "๐"]
      ),
      EmojiCategory(
        icon: "๐ฅฑ",
        emojis: ["๐ฅฑ", "๐ด", "๐คค", "๐ช", "๐ฎ", "๐ต", "๐ค"]
      )
    ]
  )
}
