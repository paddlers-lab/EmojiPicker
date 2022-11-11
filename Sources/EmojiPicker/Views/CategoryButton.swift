import SwiftUI

struct CategoryButton: View {
  
  @Binding var selectedCategory: String?
  var icon: String
  var namespace: Namespace.ID
  
  var body: some View {
    VStack {
      Text(icon)
        .padding()
        .font(.system(size: 30))
        .frame(width: 70, height: 40)
      if selectedCategory == icon {
        RoundedRectangle(cornerSize: .init(width: 7, height: 7))
          .frame(width: 30, height: 7)
          .matchedGeometryEffect(id: "CategoryButton", in: namespace)
          .foregroundColor(.accentColor)
      }
    }
    .frame(width: 80, height: 80)
    .onTapGesture {
      withAnimation(.timingCurve(0.250, 0.8, 0.1, 1)) {
        selectedCategory = icon
      }
    }
  }
}

struct CategoryButton_Preview: PreviewProvider {
  @Namespace static var namespace
  static var previews: some View {
    CategoryButton(selectedCategory: .constant("👻"), icon: "👻", namespace: namespace)
  }
}
