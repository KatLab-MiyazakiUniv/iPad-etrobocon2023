import SwiftUI

/// コースマップ全体を表すビュー
struct CourseView: View {
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
                    .blinkEffect()
                DoubleLoopEntranceBlueCurveLineView()
            }

            BlockDeTreasureView()
                .blinkEffect()
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
