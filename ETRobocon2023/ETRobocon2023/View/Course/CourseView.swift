import SwiftUI

/// コースマップ全体を表すビュー
struct CourseView: View {
    @State private var isAnimating = true

    // start point
    private var startX: CGFloat {
        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
    }

    private var startY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.endOfCornerToBranchingLength
    }

    private var startPoint: CGPoint {
        CGPoint(x: startX, y: startY)
    }

    // end point
    private var endX: CGFloat {
        startX
    }

    private var endY: CGFloat {
        startY - LCourseSize.doubleLoopEntranceBlueLineLength
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }
    
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
                path.move(to: startPoint)
                path.addLine(to: endPoint)
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
