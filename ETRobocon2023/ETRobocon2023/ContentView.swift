import SwiftUI

struct ContentView: View {
//    @State private var isAnimating: Bool = false
    var body: some View {
        CourseView()
            .scaleEffect(LCourseViewSize.previewScale)
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
