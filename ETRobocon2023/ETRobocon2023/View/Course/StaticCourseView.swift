import SwiftUI

/// コース全体を表すビュー．
struct StaticCourseView: View {
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
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct StaticCourseView

struct StaticCourseView_Previews: PreviewProvider {
    static var previews: some View {
        StaticCourseView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
