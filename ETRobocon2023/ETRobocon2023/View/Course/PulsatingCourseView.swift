import SwiftUI

/// 1つの区間を点滅させるビュー
struct PulsatingCourseView: View {
    // 点滅する区間
    @Binding var segment: SelectedCommandSectionEnum?
    
    var body: some View {
        Group {
            switch segment {
            case .FromStartToDoubleLoop:
                ZStack {
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .blue,
                                      path: StartBlueLineView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: RightBlackStraightLineView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: RightBottomBlackCornerView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: BottomBlackStraightLineView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: LeftBottomBlackCornerView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: LeftBlackStraightLineView().getBeforeDoubleLoopPath())
                }
            case .FromAreaAToAreaB:
                ZStack {
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: DoubleLoopEntranceBlackLineView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .blue,
                                      path: DoubleLoopEntranceBlueStraightLineView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .blue,
                                      path: DoubleLoopEntranceBlueCurveLineView().getPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: AreaAView().getFromAreaAToAreaBBlackPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .blue,
                                      path: AreaAView().getFromAreaAToAreaBBluePath())
                }
            case .AreaB:
                ZStack {
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: AreaAView().getAreaBBlackPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .black,
                                      path: AreaBView().getAreaBBlackPath())
                    PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                      color: .blue,
                                      path: AreaBView().getAreaBBluePath())
                }
            case .AreaABottom:
                PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: AreaAView().getAreaABottomPath())
                PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: AreaBView().getAreaABottomPath())
                PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                  color: .black,
                                  path: LeftBlackStraightLineView().getAreaABottomPath())
                PulsatingLineView(baseLineWidth: LCourseSize.lineWidth,
                                  color: .red,
                                  path: LineTraceEndCircleView().getPath())
            case .none:
                EmptyView()
            }
        } // Group
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct PulsatingCourseView

struct PulsatingCourseView_Previews: PreviewProvider {
    @State static var isAnimating = true
    @State static var segment: SelectedCommandSectionEnum? = .FromAreaAToAreaB
    static var previews: some View {
        PulsatingCourseView(segment: $segment)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
