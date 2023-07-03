import SwiftUI

/// コース左側の直進の青線
struct DoubleLoopEntranceBlueStraightLineView: View {
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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct DoubleLoopEntranceBlueStraightLineView

struct DoubleLoopEntranceBlueStraightLineView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleLoopEntranceBlueStraightLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
