import SwiftUI

/// ダブルループ入りのカーブの青線
struct DoubleLoopEntranceBlueCurveLineView: View {
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
        49
    }

    private var endY: CGFloat {
        startY - LCourseSize.doubleLoopEntranceBlueLineLength + 4
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }

    // control point
    private var controlX: CGFloat {
        19
    }

    private var controlY: CGFloat {
        startY - 155
    }

    private var controlPoint: CGPoint {
        CGPoint(x: controlX, y: controlY)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct DoubleLoopEntranceBlueCurveLineView

struct DoubleLoopEntranceBlueCurveLineView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleLoopEntranceBlueCurveLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
