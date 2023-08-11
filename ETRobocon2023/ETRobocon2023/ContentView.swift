import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = true
    @State private var segment = SegmentNames.DoubleLoopExitBlackLineView
    
    var body: some View {
//        CourseMapAndListView()
//        ButtonAndTerminalView()
//        MotionCommandOptionList()
        CourseMapAndCommandView()
//        SelectedCommandList()
//        ListToSelectOneSection()
//        DraggableVStack()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
