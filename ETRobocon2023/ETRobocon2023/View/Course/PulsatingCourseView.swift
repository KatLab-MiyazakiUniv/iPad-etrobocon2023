import SwiftUI

/// 1つの区間を点滅させるビュー
struct PulsatingCourseView: View {
    @Binding var isAnimating: Bool

    // 点滅する区間
    @Binding var segment: SegmentNames

    var body: some View {
        Group {
            switch segment {
            case .NONE:
                EmptyView()
            case .StartBlueLineView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .blue,
                                  path: StartBlueLineView().getPath())
            case .RightBlackStraightLineView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: RightBlackStraightLineView().getPath())
            case .RightBottomBlackCornerView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: RightBottomBlackCornerView().getPath())
            case .BottomBlackStraightLineView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: BottomBlackStraightLineView().getPath())
            case .LeftBottomBlackCornerView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: LeftBottomBlackCornerView().getPath())
            case .LeftBlackStraightLineView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: LeftBlackStraightLineView().getPath())
            case .DoubleLoopEntranceBlackLineView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: DoubleLoopEntranceBlackLineView().getPath())
            case .AreaAView:
                EmptyView()
            case .AreaBView:
                EmptyView()
            case .DoubleLoopExitBlackLineView:
                PulsatingLineView(isAnimating: $isAnimating,
                                  baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: DoubleLoopExitBlackLineView().getPath())
            case .DoubleLoopEntranceBlueStraightLineView:
                EmptyView()
            case .DoubleLoopEntranceBlueCurveLineView:
                EmptyView()
            case .BlockDeTreasureCircleView:
                EmptyView()
            case .LineTraceEndCircleView:
                EmptyView()
            case .BlockDeTreasureView:
                EmptyView()
            } // switch segment
        } // Group
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct PulsatingCourseView

struct PulsatingCourseView_Previews: PreviewProvider {
    @State static var isAnimating = true
    @State static var segment = SegmentNames.DoubleLoopExitBlackLineView
    static var previews: some View {
        PulsatingCourseView(isAnimating: $isAnimating, segment: $segment)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
