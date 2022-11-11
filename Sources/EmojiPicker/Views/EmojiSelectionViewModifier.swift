import SwiftUI

struct EmojiSelectionViewModifier: ViewModifier {
  
  var emojis: Emojis
  @Binding var isPresented: Bool
  @Binding var emoji: String?
  @State private var selectedCategory: String?
  @Namespace var namespace
  
  init(emojis: Emojis, isPresented: Binding<Bool>, emoji: Binding<String?>) {
    self.emojis = emojis
    self._isPresented = isPresented
    self._emoji = emoji
    self.selectedCategory = emojis.categories.first?.icon
  }
  
  var selector: some View {
    VStack {
      ScrollView {
        LazyHStack(spacing: 0) {
          ForEach(emojis.categories.map { $0.icon }, id: \.self) { icon in
            CategoryButton(selectedCategory: $selectedCategory, icon: icon, namespace: namespace)
          }
        }
      }
      ScrollView {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 15) {
          let emojis: [String] = emojis.categories.first(where: { $0.icon == selectedCategory })?.emojis ?? []
          ForEach(emojis, id: \.self) { emoji in
            Text(emoji)
              .onTapGesture {
                self.emoji = emoji
                self.isPresented = false
              }
          }
        }
      }
      .padding()
    }
    .background(Color(uiColor: .systemBackground))
    .cornerRadius(15)
    .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 3)
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

struct BackgroundClearSheet: UIViewRepresentable {

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
