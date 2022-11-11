import SwiftUI

struct EmojiButton: View {
  
  @Binding var selected: String?
  var emoji: String
  
  private var isSelected: Bool {
    selected == emoji
  }
  
  var body: some View {
    Text(emoji)
      .font(.system(size: 24))
      .onTapGesture {
        self.selected = emoji
      }
      .padding(6)
      .background(isSelected ? Color.secondarySystemBackground : .clear)
      .cornerRadius(10)
  }
}
