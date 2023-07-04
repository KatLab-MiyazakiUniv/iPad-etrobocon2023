import SwiftUI

/// コースマップと区間名のリストを横並びで表示するビュー
struct CourseMapAndListView: View {
    @State private var isAnimating = true

    // 点滅する区間
    @State private var selection = SegmentNames.NONE

    var body: some View {
        HStack {
            GeometryReader { geometry in
                CourseView(isAnimating: $isAnimating, segment: $selection)
                    .scaleEffect(geometry.size.height / LCourseViewSize.frameHeight * 0.9)
                    .frame(
                        width: min(geometry.size.height
                                   * (LCourseViewSize.frameWidth / LCourseViewSize.frameHeight),
                                   geometry.size.width),
                        height: min(geometry.size.height,
                                    geometry.size.width
                                    * (LCourseViewSize.frameHeight / LCourseViewSize.frameWidth))
                    )
            } // GeometryReader

            SegmentNamesListView(selection: $selection)
        } // HStack
    } // var body
} // struct CourseMapAndListView

struct CourseMapAndListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMapAndListView()
            .previewLayout(.fixed(width: 2732, height: 2048))
    }
}
