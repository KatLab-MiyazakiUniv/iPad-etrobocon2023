import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = true
    @State private var segment = SegmentNames.DoubleLoopExitBlackLineView
    
    var body: some View {
//        CourseMapAndListView()
        ButtonAndTerminalView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 2732, height: 2048))
    }
}
