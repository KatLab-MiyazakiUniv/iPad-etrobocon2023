import SwiftUI

/// コースマップ全体を表すビュー
struct CourseView: View {
    @EnvironmentObject private var viewModel: SelectedCommandViewModel
    @Binding var isAnimating: Bool

    // 点滅する区間
    @Binding var segment: SelectedCommandSectionEnum

    var body: some View {
        ZStack {
            StaticCourseView()
            PulsatingCourseView(isAnimating: $isAnimating, segment: $viewModel.isSelectedSection)
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
        .rotation3DEffect(viewModel.courseSide == .LeftCourse ? .degrees(0) : .degrees(180),
                          axis: (x: 0, y: 1, z: 0))
    } // var body
} // struct CourseView

struct CourseView_Previews: PreviewProvider {
    @State static var isAnimating = true
    @State static var segment = SelectedCommandSectionEnum.FromStartToDoubleLoop
    static var previews: some View {
        CourseView(isAnimating: $isAnimating, segment: $segment)
            .environmentObject(SelectedCommandViewModel())
            .scaleEffect(0.2)
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
