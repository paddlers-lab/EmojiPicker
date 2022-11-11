import SwiftUI
import EmojiPicker

struct ContentView: View {
  
  @State var emoji: String?
  
  var body: some View {
    VStack {
      HStack {
        EmojiPicker(emojis: .emotion, selection: $emoji, placeholder: "絵文字を選択")
          .padding()
      }
      
      List {
        EmojiPicker(emojis: .emotion, selection: $emoji, placeholder: "絵文字を選択")
      }
    }
    
  }
}
