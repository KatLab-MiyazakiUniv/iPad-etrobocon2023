import SwiftUI

/// 1つの区間を点滅させるビュー
struct PulsatingCourseView: View {
    @Binding var isAnimating: Bool

    // 点滅する区間
    @Binding var segment: SelectedCommandSectionEnum?

    var body: some View {
        Group {
            switch segment {
            case .FromStartToDoubleLoop:
                ZStack {
                    PulsatingLineView(isAnimating: $isAnimating,
                                      baseLineWidth: LCourseSize.lineWidth,
                                      color: .blue,
                                      path: StartBlueLineView().getPath())
                    PulsatingLineView(isAnimating: $isAnimating,
                                      baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: RightBlackStraightLineView().getPath())
                    PulsatingLineView(isAnimating: $isAnimating,
                                      baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: RightBottomBlackCornerView().getPath())
                    PulsatingLineView(isAnimating: $isAnimating,
                                      baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: BottomBlackStraightLineView().getPath())
                    PulsatingLineView(isAnimating: $isAnimating,
                                      baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: LeftBottomBlackCornerView().getPath())
                    PulsatingLineView(isAnimating: $isAnimating,
                                      baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: LeftBlackStraightLineView().getBeforeDoubleLoopPath())
                }
            case .FromAreaAToAreaB:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: RightBottomBlackCornerView().getPath())
            case .AreaB:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: BottomBlackStraightLineView().getPath())
            case .AreaABottom:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: LeftBlackStraightLineView().getPath())
            case .none:
                EmptyView()
            }
        } // Group
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct PulsatingCourseView

struct PulsatingCourseView_Previews: PreviewProvider {
    @State static var isAnimating = true
    @State static var segment: SelectedCommandSectionEnum? = .FromStartToDoubleLoop
    static var previews: some View {
        PulsatingCourseView(isAnimating: $isAnimating, segment: $segment)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
