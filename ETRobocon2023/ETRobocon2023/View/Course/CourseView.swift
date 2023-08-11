import SwiftUI

/// コースマップ全体を表すビュー
struct CourseView: View {
    @Binding var isAnimating: Bool

    // 点滅する区間
    @Binding var segment: SelectedCommandSectionEnum

    var body: some View {
        ZStack {
            StaticCourseView()
            PulsatingCourseView(isAnimating: $isAnimating, segment: $segment)
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct CourseView

struct CourseView_Previews: PreviewProvider {
    @State static var isAnimating = true
    @State static var segment = SelectedCommandSectionEnum.FromStartToDoubleLoop
    static var previews: some View {
        CourseView(isAnimating: $isAnimating, segment: $segment)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
