import SwiftUI

struct PulsatingLineView: View {
    @Binding var isAnimating: Bool
    @State private var animatedLineWidth: CGFloat
    let path: (inout Path) -> Void
    let baseLineWidth: CGFloat

    init(isAnimating: Binding<Bool>, baseLineWidth: CGFloat, path: @escaping (inout Path) -> Void) {
        self._isAnimating = isAnimating
        self._animatedLineWidth = State(initialValue: baseLineWidth)
        self.baseLineWidth = baseLineWidth
        self.path = path
    }

    var body: some View {
        Path { path in
            self.path(&path)
        }
        .stroke(Color.blue.opacity(Double(animatedLineWidth / (3 * baseLineWidth))), lineWidth: animatedLineWidth)
        .onAppear {
            if isAnimating {
                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    animatedLineWidth = 3 * baseLineWidth
                }
            }
        }
        .onChange(of: isAnimating) { newValue in
            if newValue {
                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
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
    static var previews: some View {
        PulsatingLineView(isAnimating: $isAnimating, baseLineWidth: 20.0) { path in
            path.move(to: CGPoint(x: 50, y: 50))
            path.addLine(to: CGPoint(x: 50, y: 250))
        }
    }
}
