import SwiftUI

public struct EmojiPicker: View {
  
  private var emojis: Emojis
  @Binding private var selection: String?
  @State private var isPresentedSelector: Bool = false
  private var placeholder: LocalizedStringKey?
  
  public init(
    emojis: Emojis,
    selection: Binding<String?>,
    placeholder: LocalizedStringKey? = nil
  ) {
    self.emojis = emojis
    self._selection = selection
    self.placeholder = placeholder
  }
  
  public var body: some View {
    HStack {
      if let selection {
        Text(selection)
      } else {
        Text(placeholder ?? "")
          .foregroundColor(.secondary)
      }
      Spacer()
      Image(systemName: "chevron.up.chevron.down")
        .foregroundColor(.accentColor)
    }
    .emojiSelector(emojis: emojis,isPresented: $isPresentedSelector, emoji: $selection)
    .contentShape(Rectangle()) // WHY: HStackのSpacerに対してもタップ判定を行う
    .onTapGesture {
      withAnimation(.easeInOut) {
        isPresentedSelector = true
      }
    }
  }
}

struct EmojiPickerExample: View {
  
  @State var emoji: String?
  
  var body: some View {
    EmojiPicker(emojis: .emotion, selection: $emoji)
  }
}

struct EmojiPicker_Preview: PreviewProvider {
  static var previews: some View {
    EmojiPickerExample()
  }
}
