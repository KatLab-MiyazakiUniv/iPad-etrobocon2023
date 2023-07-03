import SwiftUI

struct ContentView: View {
    var body: some View {
        CourseView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
