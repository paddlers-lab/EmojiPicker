import SwiftUI

struct EmojiButton: View {
  
  @Binding var selected: String?
  var emoji: String
  var action: () -> Void
  
  private var isSelected: Bool {
    selected == emoji
  }
  
  var body: some View {
    Text(emoji)
      .font(.system(size: 24))
      .onTapGesture {
        action()
      }
      .padding(6)
      .background(isSelected ? Color.secondarySystemBackground : .clear)
      .cornerRadius(10)
  }
}
