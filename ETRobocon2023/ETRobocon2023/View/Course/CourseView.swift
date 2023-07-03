import SwiftUI

/// コースマップ全体を表すビュー
struct CourseView: View {
    @State private var isAnimating = true

    private var centerPoint = CGPoint(x: LCourseSize.centerXOfA, y: LCourseSize.centerYOfA)
    
    var body: some View {
        ZStack {
            // ライントレース
            Group {
                StartBlueLineView()
                RightBlackStraightLineView()
                RightBottomBlackCornerView()
                BottomBlackStraightLineView()
                LeftBottomBlackCornerView()
                LeftBlackStraightLineView()
                LineTraceEndCircleView()
            }

            // ダブルループ
            Group {
                DoubleLoopEntranceBlackLineView()
                AreaAView()
                AreaBView()
                DoubleLoopExitBlackLineView()
                DoubleLoopEntranceBlueStraightLineView()
                DoubleLoopEntranceBlueCurveLineView()
            }

            BlockDeTreasureView()
            PulsatingLineView(isAnimating: $isAnimating,
                              baseLineWidth: LCourseSize.lineWidth) { path in
                path.addArc(center: centerPoint,
                            radius: LCourseSize.blackCircleRadiusOfA,
                            startAngle: .degrees(0),
                            endAngle: .degrees(0.001),
                            clockwise: true)
            }
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct CourseView

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
