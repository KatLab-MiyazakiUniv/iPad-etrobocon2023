import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = true
    @State private var segment = SegmentNames.DoubleLoopExitBlackLineView
    
    var body: some View {
        CourseView(isAnimating: $isAnimating, segment: $segment)
            .scaleEffect(0.28)
//        VStack {
//            PulsatingLineView(isAnimating: $isAnimating, baseLineWidth: 20.0) { path in
//                path.move(to: CGPoint(x: 50, y: 50))
//                path.addLine(to: CGPoint(x: 50, y: 250))
//            }
//
//            Button(action: {
//                isAnimating.toggle()
//            }) {
//                Text(isAnimating ? "Stop Animation" : "Start Animation")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
