import SwiftUI

struct FlagView: View {
  @State private var showScore = false
  @State private var scoreTitle = "结果"
  @State private var countries = ["BR", "CA", "DE", "GB", "IL", "IN", "JP", "KR", "NZ", "SG", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  // 分数
  @State private var score = 0
  // 国旗被点击
  func flagTaped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "正确"
      score+=1
    } else {
      scoreTitle = "错误"
      showScore = true
    }
  }
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
  var body: some View {
    ZStack {
      RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
      ], center: .top, startRadius: 200, endRadius: 400)
        .ignoresSafeArea()
      VStack {
        Spacer()
        Text("Guess the Flag")
          .font(.largeTitle.weight(.bold))
          .foregroundColor(.white)
        VStack(spacing: 0) {
          VStack {
            Text("请点击正确的旗帜")
              .font(.subheadline.weight(.heavy))
              .foregroundColor(.white)
            Text(countries[correctAnswer])
              .font(.largeTitle.weight(.semibold))
              .foregroundStyle(.secondary)
          }
          ForEach(0..<3) { number in
            Button {
              // flag was tapped
              flagTaped(number)
              askQuestion()
            } label: {
              Image(countries[number])
                .renderingMode(.original)
                // 这里改变图片的大小
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 5)
            }
              .alert("答错了❌，重新记分",isPresented: $showScore){
                Button("重新开始"){
                  score = 0
                }
              }
          }
        }
          .frame(maxWidth: .infinity)
          .padding(.vertical, 20)
          .background(.regularMaterial)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Spacer()
        Spacer()
        Text(scoreTitle)
          .font(.title2)
          .padding(20)
          .background(.regularMaterial)
        Text("Score: \(score)")
          .foregroundColor(.white)
          .font(.title.bold())
        Spacer()
      }
        .padding()
    }
  }
}

struct Flag_Previews: PreviewProvider {
  static var previews: some View {
    FlagView()
      .previewDevice("iphone 13 mini")
  }
}
