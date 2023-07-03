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
            }

            // ダブルループ
            Group {
                DoubleLoopEntranceBlackLineView()
            }
        } // ZStack
    } // var body
} // struct CourseView

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
