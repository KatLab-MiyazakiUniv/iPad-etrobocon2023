import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = true
    @State private var segment = SegmentNames.DoubleLoopExitBlackLineView
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }

    var body: some View {
        TabView {
            CourseMapAndCommandView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                    }
                }

            ButtonAndTerminalView()
                .tabItem {
                    VStack {
                        Image(systemName: "paperplane.fill")
                    }
                }

            LogChartView()
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg")
                    }
                }
        } // TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SelectedCommandViewModel())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
