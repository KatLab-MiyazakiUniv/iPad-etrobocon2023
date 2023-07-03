import SwiftUI

/// ライントレース終端の赤い円
struct LineTraceEndCircleView: View {
    // center point
    private var centerX: CGFloat {
        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
    }

    private var centerY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.leftBlackStraightLineLength - LCourseSize.lineHalfWidth - LCourseSize.treasureCircleRadius
    }

    private var centerPoint: CGPoint {
        CGPoint(x: centerX, y: centerY)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct LineTraceEndCircleView

struct LineTraceEndCircleView_Previews: PreviewProvider {
    static var previews: some View {
        LineTraceEndCircleView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
