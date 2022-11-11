import SwiftUI

fileprivate struct EmojiSelectionViewModifier: ViewModifier {
  
  var emojis: Emojis
  @Binding var isPresented: Bool
  @Binding var emoji: String?
  @State private var selectedCategory: String?
  @Namespace var namespace
  
  init(emojis: Emojis, isPresented: Binding<Bool>, emoji: Binding<String?>) {
    self.selectedCategory = emojis.categories.first?.icon
    self.emojis = emojis
    self._isPresented = isPresented
    self._emoji = emoji
  }
  
  var selector: some View {
    VStack {
      RoundedRectangle(cornerSize: .init(width: 3, height: 3))
        .frame(width: 30, height: 5)
        .foregroundColor(Color.systemGray3)
        .padding(.top)
      ScrollView(.horizontal) {
        LazyHGrid(rows: [GridItem()]) {
          ForEach(emojis.categories.map { $0.icon }, id: \.self) { icon in
            CategoryButton(selectedCategory: $selectedCategory, icon: icon, namespace: namespace)
          }
        }
      }
      .padding(.horizontal)
      
      Divider()
      
      ScrollView(.vertical) {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 8), spacing: 15) {
          let emojis: [String] = emojis.categories.first(where: { $0.icon == selectedCategory })?.emojis ?? []
          ForEach(emojis, id: \.self) { emoji in
            EmojiButton(selected: self.$emoji, emoji: emoji) {
              self.emoji = emoji
              self.isPresented = false
            }
          }
        }
        .animation(nil, value: selectedCategory)
      }
      .padding()
    }
    .background(Color(uiColor: .systemBackground))
    .cornerRadius(36)
    .shadow(color: .black.opacity(0.1), radius: 0, x: 0, y: 10)
    .padding(.horizontal)
    .padding(.bottom, 80)
  }
  
  func body(content: Content) -> some View {
    content
      .sheet(isPresented: $isPresented) {
        selector
          .offset(.init(width: 0, height: 70))
          .presentationDetents([.medium])
          .background(BackgroundClearSheet())
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

fileprivate struct BackgroundClearSheet: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    Task {
      view.superview?.superview?.backgroundColor = .clear
    }
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {}
}



extension View {
  func emojiSelector(
    emojis: Emojis,
    isPresented: Binding<Bool>,
    emoji: Binding<String?>
  ) -> some View {
    modifier(EmojiSelectionViewModifier(emojis: emojis, isPresented: isPresented, emoji: emoji))
  }
}

struct EmojiPickerCheck_Preview: PreviewProvider {
  static var previews: some View {
    EmojiPicker(emojis: .emotion, selection: .constant(nil), placeholder: "絵文字を選択")
  }
}
