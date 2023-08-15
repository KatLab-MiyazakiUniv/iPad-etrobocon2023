import SwiftUI

struct PulsatingLineView: View {
    var isAnimating = true
    @State private var animatedLineWidth: CGFloat
    let path: (inout Path) -> Void
    let baseLineWidth: CGFloat
    let color: Color  // 新しい引数

    init(baseLineWidth: CGFloat, color: Color = .black, path: @escaping (inout Path) -> Void) {
        self._animatedLineWidth = State(initialValue: baseLineWidth)
        self.baseLineWidth = baseLineWidth
        self.color = color  // 引数をプロパティに保存
        self.path = path
    }

    var body: some View {
        Path { path in
            self.path(&path)
        }
        .stroke(color.opacity(Double((animatedLineWidth - baseLineWidth) / (2 * baseLineWidth))), lineWidth: animatedLineWidth)
        .onAppear {
            if isAnimating {
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    animatedLineWidth = 3 * baseLineWidth
                }
            }
        }
        .onChange(of: isAnimating) { newValue in
            if newValue {
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    animatedLineWidth = 3 * baseLineWidth
                }
            } else {
                withAnimation {
                    animatedLineWidth = baseLineWidth
                }
            }
        }
    }
}

struct PulsatingLineView_Previews: PreviewProvider {
    @State static var isAnimating: Bool = true
    static var bluePrint: (inout Path) -> Void = { path in
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 50, y: 250))
    }
    static var previews: some View {
        PulsatingLineView(baseLineWidth: 20.0, path: bluePrint)
    }
}
