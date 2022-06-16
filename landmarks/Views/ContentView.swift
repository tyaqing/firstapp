import SwiftUI

struct CapsuleText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.largeTitle)
      .padding()
      .foregroundColor(.white)
      .background(.blue)
      .clipShape(Capsule())
  }
}

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(.white)
      .padding()
      .background(.red)
      .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

extension View {
  func titleStyle() -> some View {
    modifier(Title())
  }
}

struct Watermark: ViewModifier {
  var text: String
  func body(content: Content) -> some View {
    ZStack(alignment: .bottomTrailing) {
      content
      Text(text)
        .font(.caption)
        .foregroundColor(.white)
        .padding(5)
        .background(.black)
    }
  }
}

extension View {
  func watermarked(with text: String) -> some View {
    modifier(Watermark(text: text))
  }
}

struct ContentView: View {
  @State private var useRedText = false
  var body: some View {

    VStack(spacing: 10) {
      Color.blue
        .frame(width: 300, height: 200)
        .watermarked(with: "Hacking with Swift")

      Text("Bob")
        .titleStyle()
    }
  }
}

struct WeSplit_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iphone 13 mini")
  }
}
